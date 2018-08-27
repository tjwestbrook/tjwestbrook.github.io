#include <fstream>
#include <iostream>
#include <Windows.h>
#include <stdlib.h>
#include <time.h>
using namespace std;

class Tile {
private:
	//Variables
	int tile[9][9]; //holds the values/answers of each tile & initializes all 81 tiles of puzzle answers (if box = "0" it is blank)
	bool fixed[9][9]; //determines whether or not the tile has a fixed answer or not to distinguish from the rest in color
	bool poss[9][9][10]; //array that lists the possibilities in a given box
	bool guess_mode = false; //guesses do not need to be made yet
	int backtrack_count = 0; //counts the number of backtracks taken
	clock_t start_time = clock(); //starting timer

	//Functions
	void timer_and_backtrack_counter(); //keeps track of time & backtracks
	void set_color(int color); //sets colors
	void set(); //sets the initial puzzle
	void output_puzzle(); //displays puzzle
	void find_all_possibilities(); //finds and counts all possibilities in all tiles
	void deduce_puzzle(); //deducts and updates possibilities
	void deduce_queue(int original_x, int original_y); //deducts rows/columns/3x3 boxes that are queued to be updated
	bool make_guesses(); //if deduction stops working, the program will go to this function and guess and check a possibility
	bool puzzle_solved(); //checks if the puzzle has been solved

	int count_poss(int x, int y); //counts the amount of possibilities in a given tile
	int find_single_poss(int x, int y); //finds the single possibility/answer to a tile
	int find_next_poss(int x, int y, int i); //finds a possibility to a tile in a specific iteration

	bool check_if_possibility(int x, int y, int p); //checks if there is a possibility
	bool check_row(int y, int p); //checks the row of the box
	bool check_column(int x, int p); //checks the column of the box
	bool check_3x3_box(int x, int y, int p); //checks the 3x3 box of the box

	void update_possibilities(int x, int y, int p); //updates all possibilities need to be updated
	void update_row(int y, int p); //updates the possibilities in a row
	void update_column(int x, int p); //updates the possibilities in a column
	void update_3x3_box(int x, int y, int p); //updates the possibilities in a 3x3 box

public:
	Tile() { //constructor that is essentially the main function
		set(); //initalizes puzzle_answers array to be set to the specific sudoku puzzle
		find_all_possibilities(); //finds and counts every possibility in every box
		output_puzzle(); //outputs the original puzzle

		while (!puzzle_solved()) { //while the puzzle hasn't been solved...
			if (!guess_mode) { deduce_puzzle(); } //deducts all possible answers in the puzzle
			else { make_guesses(); } //continuously makes guesses to solve the puzzle (brute-force)
			output_puzzle(); //updates and displays the puzzle
			timer_and_backtrack_counter(); //outputs current timespan & number of backtracks
		}
	}
};


int main() {
	srand(time(NULL)); //creates the random numbers to be used in guessing
	
	Tile t; //initializes the variable "t" and declares the Tile class's constructor

	system("Pause");
	return 0;
}


void Tile::timer_and_backtrack_counter() {
	double duration = (clock() - start_time) / (double)CLOCKS_PER_SEC;
	cout << duration << " seconds have passed" << endl;
	cout << backtrack_count << " backtracks have been done" << endl;
}
void Tile::set_color(int color) {
	HANDLE hcon = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleTextAttribute(hcon, color);
}
void Tile::set() {
	for (int x = 0; x < 9; x++) {
		for (int y = 0; y < 9; y++) {
			fixed[x][y] = false; //assumes all tiles are not fixed
		}
	}
	
	ifstream sudoku_puzzle_file("C:\\Users\\Smoovebones115\\Documents\\Visual Studio 2015\\Projects\\Sudoku_Puzzle_Solver\\Sudoku_Puzzle_Solver\\sudokupuzzles\\hard\\puzzle5.txt"); //file object that holds all sudoku puzzles
	for (int x = 0; x < 9; x++) {
		for (int y = 0; y < 9; y++) {
			sudoku_puzzle_file >> tile[x][y]; //inputs each integer into a tile
			if (tile[x][y] != 0) { fixed[x][y] = true; } //if the tile is not blank, it is recorded as fixed}
		}
	}
}
void Tile::output_puzzle() {
	system("CLS"); //repeatedly clears the screen for every update
	set_color(10);
	cout << endl;

	for (int y = 8; y > -1; y--) { //rows
		cout << "  "; //puts space between puzzle and border
		for (int x = 0; x < 9; x++) { //columns
			if (tile[x][y] == 0) { cout << " "; } //if that box is blank, output a space
			else {
				if (!fixed[x][y]) { set_color(12); } //changes color of tile if not a fixed/given answer
				cout << tile[x][y]; //else, output the answer
				set_color(10);
			}
			if (x != 8) {
				if ((x + 1) % 3 == 0) { cout << " " << char(222) << " "; } //separates the 3x3 boxes
				else { cout << " | "; } //separates every box
			}
		}
		if (y != 0) {
			if (y % 3 == 0) {
				cout << endl << "  ";
				for (int c = 0; c < 35; c++) { cout << char(220); } //separates the 3x3 boxes
			}
			else { cout << endl << "  -----------------------------------"; } //separates every box
		}
		cout << endl;
	}
	cout << endl;
}
void Tile::find_all_possibilities() {
	for (int x = 0; x < 9; x++) {
		for (int y = 0; y < 9; y++) {
			if (tile[x][y] == 0) { //if the box is blank...
				for (int p = 1; p < 10; p++) { //checks all numbers for possibilities
					if (check_if_possibility(x, y, p)) { //if the number is a possibility...
						poss[x][y][p] = true; //possibility is true (the last int in the 3D array is the possibility)
					}
					else { poss[x][y][p] = false; } //possibility is not true
				}
			}
		}
	}
}
void Tile::deduce_puzzle() {
	bool need_guesses = true;
	for (int x = 0; x < 9; x++) {
		for (int y = 0; y < 9; y++) {
			if (tile[x][y] == 0) { //if the tile is blank...
				if (count_poss(x, y) == 1) { //if the tile has one possibility...
					need_guesses = false; //if the function is finding tiles with single possiblities, it does not need a guess
					tile[x][y] = find_single_poss(x, y); //it must be the answer
					update_possibilities(x, y, tile[x][y]); //updates the new possibilities
					deduce_queue(x, y); //deduces from this tile's row/column/3x3 box
				}
				else if (count_poss(x, y) == 0) {
					cout << "puzzle is invalid because of tile[" << x << "][" << y << "] containing zero possibilities." << endl;
					cout << "Please only enter valid Sudoku puzzles." << endl;
					system("Pause");
					system("End");
				}
			}
		}
	}
	if (need_guesses) { guess_mode = true; } //switches to guess mode
}
void Tile::deduce_queue(int original_x, int original_y) {
	for (int y = 0; y < 9; y++) { //checks row
		if (count_poss(original_x, y) == 1) { //if tile has 1 possibility...
			tile[original_x][y] = find_single_poss(original_x, y); //that single possibility must be the answer
			update_possibilities(original_x, y, tile[original_x][y]); //updates the possibilities within the row
			deduce_queue(original_x, y); //deduce off of new answer
		}
	}

	for (int x = 0; x < 9; x++) { //checks column
		if (count_poss(x, original_y) == 1) { //if tile has 1 possibility...
			tile[x][original_y] = find_single_poss(x, original_y); //that single possibility must be the answer
			update_possibilities(x, original_y, tile[x][original_y]); //updates the possibilities within the column
			deduce_queue(x, original_y); //deduce off of new answer
		}
	}

	int xbox, ybox; //establishes x & y location of the 3x3 box
	if (original_x % 3 == 0) { xbox = original_x; }
	if (original_x % 3 == 1) { xbox = original_x - 1; }
	if (original_x % 3 == 2) { xbox = original_x - 2; }
	if (original_y % 3 == 0) { ybox = original_y; }
	if (original_y % 3 == 1) { ybox = original_y - 1; }
	if (original_y % 3 == 2) { ybox = original_y - 2; }

	for (int a = xbox; a < xbox + 3; a++) { //checks 3x3 box
		for (int b = ybox; b < ybox + 3; b++) { //checks 3x3 box
			if (count_poss(xbox, ybox) == 1) { //if tile has 1 possiblity...
				tile[xbox][ybox] = find_single_poss(xbox, ybox); //that single possibility must be the answer
				update_possibilities(xbox, ybox, tile[xbox][ybox]); //updates the possibilities within the 3x3 box
				deduce_queue(xbox, ybox); //deduce off of new answer
			}
		}
	}
}

int Tile::count_poss(int x, int y) {
	int count = 0; //number of posssibilities
	for (int p = 1; p < 10; p++) {
		if (poss[x][y][p] == true) { count++; } //if this possibility is true, add to the count
	}
	return count; //return the total amount of counts
}
int Tile::find_single_poss(int x, int y) {
	for (int p = 1; p < 10; p++) {
		if (poss[x][y][p] == true) { return p; } //if a possibility is found, return it
	}
	return 0; //return as blank tile
}
int Tile::find_next_poss(int x, int y, int i) {
	int count = 0; //number of possibilities passed
	for (int p = 1; p < 10; p++) {
		if (poss[x][y][p] == true) { count++; } //if a possibility is found, add 1 to count
		if (count == i) { return p; } //if the desired iteration of possibilities is found, return that possibility
	}
	return 0; //return as blank tile
}

bool Tile::make_guesses() {
	output_puzzle();
	timer_and_backtrack_counter(); //outputs current timespan & number of backtracks
	for (int x = 0; x < 9; x++) {
		for (int y = 0; y < 9; y++) {
			if (tile[x][y] == 0) { //if the tile is blank and can be guessed on...
				for (int k = 1; k < 10; k++) {
					if (check_if_possibility(x, y, k)) {
						tile[x][y] = k; //established as a fixed tile answer
						bool success = make_guesses(); //recursively calls the function to continuously establish guessing tiles with answers
						if (success) { return true; } //returns true to get out of loop
					}
				}
				tile[x][y] = 0; //erases said guess so that it can be guessed on later
				backtrack_count++; //increases backtrack counter every time a backtrack is done
				return false; //returns false when a blank tile cannot be deduced on
			}
		}
	}
	return true; //finishes the recursive function by returning true
}

bool Tile::check_if_possibility(int x, int y, int p) { //checks if the row, column, or 3x3 box contain the possibility being checked
	if (check_row(y, p) && check_column(x, p) && check_3x3_box(x, y, p)) { return true; }
	return false;
}
bool Tile::check_row(int y, int p) { //checks row of box being checked for possibilities
	for (int x = 0; x < 9; x++) {
		if (tile[x][y] == p) { return false; } //if any box contains that number, it is not a possibility
	}
	return true;
}
bool Tile::check_column(int x, int p) { //checks column of box being checked for possibilities
	for (int y = 0; y < 9; y++) {
		if (tile[x][y] == p) { return false; } //if any box contains that number, it is not a possibility
	}
	return true;
}
bool Tile::check_3x3_box(int x, int y, int p) {
	int xbox, ybox; //establishes x & y location of the 3x3 box the tile being checked is in
	if (x % 3 == 0) { xbox = x; }
	if (x % 3 == 1) { xbox = x - 1; }
	if (x % 3 == 2) { xbox = x - 2; }
	if (y % 3 == 0) { ybox = y; }
	if (y % 3 == 1) { ybox = y - 1; }
	if (y % 3 == 2) { ybox = y - 2; }

	for (int a = xbox; a < xbox + 3; a++) {
		for (int b = ybox; b < ybox + 3; b++) {
			if (tile[a][b] == p) { return false; } //if any tile contains that number, it is not a possibility
		}
	}
	return true;
}

void Tile::update_possibilities(int x, int y, int p) { //updates the row/column/3x3 box of a given tile
	update_row(y, p);
	update_column(x, p);
	update_3x3_box(x, y, p);
}
void Tile::update_row(int y, int p) { //if a tile had a possibility which is now an answer in that row, it is no longer a possibility
	for (int x = 0; x < 9; x++) {
		if (poss[x][y][p] == true) { poss[x][y][p] = false; }
	}
}
void Tile::update_column(int x, int p) { //if a tile had a possibility which is now an answer in that column, it is no longer a possibility
	for (int y = 0; y < 9; y++) {
		if (poss[x][y][p] == true) { poss[x][y][p] = false; }
	}
}
void Tile::update_3x3_box(int x, int y, int p) { //if a tile had a possibility which is now an answer in that 3x3 box, it is no longer a possibility
	int xbox, ybox; //establishes x & y location of the 3x3 box the box being updated is in
	if (x % 3 == 0) { xbox = x; }
	if (x % 3 == 1) { xbox = x - 1; }
	if (x % 3 == 2) { xbox = x - 2; }
	if (y % 3 == 0) { ybox = y; }
	if (y % 3 == 1) { ybox = y - 1; }
	if (y % 3 == 2) { ybox = y - 2; }

	for (int a = xbox; a < xbox + 3; a++) {
		for (int b = ybox; b < ybox + 3; b++) {
			if (poss[a][b][p] == true) { poss[a][b][p] = false; }
		}
	}
}

bool Tile::puzzle_solved() { //checks if the puzzle has been solved
	for (int x = 0; x < 9; x++) {
		for (int y = 0; y < 9; y++) {
			if (tile[x][y] == 0) { return false; } //if one of the boxes are blank, the puzzle hasn't been solved
		}
	}
	//cout << min << ":" << sec << "." << millisec << endl;
	return true;
}