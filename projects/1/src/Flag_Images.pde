void flagImage() {
  color tcolor = blank;
  
  if (level == 1) { //gay pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        //changes colors of tiles
        if (y == 0 && x == 5) { tcolor = blank; } //one blank tile
        else if (y == 0) { tcolor = purple; }
        else if (y == 1) { tcolor = blue; }
        else if (y == 2) { tcolor = green; }
        else if (y == 3) { tcolor = yellow; }
        else if (y == 4) { tcolor = orange; }
        else if (y == 5) { tcolor = red; }
        tile[y][x].setColor(tcolor); //sets color of tile
      }
    }
  }
  
  if (level == 2) { //transgender pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 5) { tcolor = babyBlue; }
        else if (y == 1 || y == 4) { tcolor = lightPink; }
        else if (y == 2 || y == 3) { tcolor = lightGray; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 3) { //bisexual pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = blue; }
        else if (y == 2 || y == 3) { tcolor = purple; }
        else if (y == 4 || y == 5) { tcolor = pink; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
    
  if (level == 4) { //pansexual pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = lightBlue; }
        else if (y == 2 || y == 3) { tcolor = yellow; }
        else if (y == 4 || y == 5) { tcolor = pink; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 5) { //asexual/demisexual pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = purple; }
        else if (y == 2) { tcolor = lightGray; }
        else if (y == 3) { tcolor = gray; }
        else if (y == 4 || y == 5) { tcolor = black; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 6) { //genderqueer pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = darkGreen; }
        else if (y == 2 || y == 3) { tcolor = lightGray; }
        else if (y == 4 || y == 5) { tcolor = lightPurple; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 7) { //polysexual pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 1) { tcolor = black; }
        else if (y == 2) { tcolor = purple; }
        else if (y == 3) { tcolor = lightGray; }
        else if (y == 4 || y == 5) { tcolor = yellow; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 8) { //genderfluid pride flag
  for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0) { tcolor = blue; }
        else if (y == 1) { tcolor = black; }
        else if (y == 2 || y == 3) { tcolor = darkViolet; }
        else if (y == 4) { tcolor = lightGray; }
        else if (y == 5) { tcolor = lightPink; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 9) { //bigender pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0 || y == 5) { tcolor = lavender; }
        else if (y == 1 || y == 4) { tcolor = lightGray; }
        else if (y == 2) { tcolor = lightPink; }
        else if (y == 3) { tcolor = babyBlue; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 10) { //intersex pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if ((y == 1 || y == 4) && (x == 2 || x == 3)) { tcolor = purple; }
        else if ((y == 2 || y == 3) && ( x == 1 || x == 4)) { tcolor = purple; }
        else { tcolor = yellow; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 11) { //bear pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0) { tcolor = black; }
        else if (y == 1) { tcolor = lightGray; }
        else if (y == 2) { tcolor = lightOrange; }
        else if (y == 3) { tcolor = yellow; }
        else if (y == 4) { tcolor = orange; }
        else if (y == 5) { tcolor = brown; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 12) { //lipstick lesbian pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
        else if (y == 0) { tcolor = darkRed; }
        else if (y == 1) { tcolor = lightRed; }
        else if (y == 2) { tcolor = lightPink; }
        else if (y  == 3) { tcolor = violet; }
        else if (y == 4) { tcolor = darkViolet; }
        else if (y == 5) { tcolor = purple; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 13) { //twink pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 5) { tcolor = blank; }
         else if (y == 0 || y == 1) { tcolor = lightYellow; }
        else if (y == 2 || y == 3) { tcolor = lightGray; }
        else if (y == 4 || y == 5) { tcolor = lightPink; }
        tile[y][x].setColor(tcolor);
      }
    }
  }
  
  if (level == 14) { //straight ally pride flag
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (y == 0 && x == 3) { tcolor = blank; }
        
        else if (y == 0) {
          if (x == 2 || x == 3) { tcolor = lightGray; }
          else { tcolor = purple; }
          
        } else if (y == 1) {
          if (x == 2 || x == 3) { tcolor = black; }
          else { tcolor = blue; }
          
        } else if (y == 2) {
          if (x == 0 || x == 5) { tcolor = lightGray; }
          else { tcolor = green; }
          
        } else if (y == 3) {
          if (x == 0 || x == 5) { tcolor = black; }
          else { tcolor = yellow; }
          
        } else if (y == 4) {
          if (x == 2 || x == 3) { tcolor = orange; }
          else { tcolor = lightGray; }
          
        } else {
            if (x == 2 || x == 3) { tcolor = red; }
            else { tcolor = black; }
        }
        
        tile[y][x].setColor(tcolor);
      }
    }
  }
}

boolean userWon() {
  int checkWinCount = 0;
  
  if (level == 1) { //gay pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == purple) { checkWinCount++; }
      if (tile[1][x].getColor() == blue) { checkWinCount++; }
      if (tile[2][x].getColor() == green) { checkWinCount++; }
      if (tile[3][x].getColor() == yellow) { checkWinCount++; }
      if (tile[4][x].getColor() == orange) { checkWinCount++; }
      if (tile[5][x].getColor() == red) { checkWinCount++; }
    }
  }

  else if (level == 2) { //transgender pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == babyBlue) { checkWinCount++; }
      if (tile[1][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[2][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[3][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[4][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[5][x].getColor() == babyBlue) { checkWinCount++; }
    }
  }
  
  else if (level == 3) { //bisexual pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == blue) { checkWinCount++; }
      if (tile[1][x].getColor() == blue) { checkWinCount++; }
      if (tile[2][x].getColor() == purple) { checkWinCount++; }
      if (tile[3][x].getColor() == purple) { checkWinCount++; }
      if (tile[4][x].getColor() == pink) { checkWinCount++; }
      if (tile[5][x].getColor() == pink) { checkWinCount++; }
    }
  }
  
  else if (level == 4) { //pansexual pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == lightBlue) { checkWinCount++; }
      if (tile[1][x].getColor() == lightBlue) { checkWinCount++; }
      if (tile[2][x].getColor() == yellow) { checkWinCount++; }
      if (tile[3][x].getColor() == yellow) { checkWinCount++; }
      if (tile[4][x].getColor() == pink) { checkWinCount++; }
      if (tile[5][x].getColor() == pink) { checkWinCount++; }
    }
  }
  
  else if (level == 5) { //asexual/demisexual pride flag
     for (int x = 0; x < num_of_col; x++) {
       if (tile[0][x].getColor() == purple) { checkWinCount++; }
       if (tile[1][x].getColor() == purple) { checkWinCount++; }
       if (tile[2][x].getColor() == lightGray) { checkWinCount++; }
       if (tile[3][x].getColor() == gray) { checkWinCount++; }
       if (tile[4][x].getColor() == black) { checkWinCount++; }
       if (tile[5][x].getColor() == black) { checkWinCount++; }
     }
   }
  
  else if (level == 6) { //genderqueer pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == darkGreen) { checkWinCount++; }
      if (tile[1][x].getColor() == darkGreen) { checkWinCount++; }
      if (tile[2][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[3][x].getColor() == lightGray) { checkWinCount++; }  
      if (tile[4][x].getColor() == lightPurple) { checkWinCount++; }
      if (tile[5][x].getColor() == lightPurple) { checkWinCount++; }
    }
  }
  
  else if (level == 7) { //non-binary pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == black) { checkWinCount++; }
      if (tile[1][x].getColor() == black) { checkWinCount++; }
      if (tile[2][x].getColor() == purple) { checkWinCount++; }
      if (tile[3][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[4][x].getColor() == yellow) { checkWinCount++; }
      if (tile[5][x].getColor() == yellow) { checkWinCount++; }
    }
  }
  
  else if (level == 8) { //genderfluid pride flag
    for (int x = 0; x < num_of_col; x++) {  
      if (tile[0][x].getColor() == blue) { checkWinCount++; }
      if (tile[1][x].getColor() == black) { checkWinCount++; }
      if (tile[2][x].getColor() == darkViolet) { checkWinCount++; }
      if (tile[3][x].getColor() == darkViolet) { checkWinCount++; }
      if (tile[4][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[5][x].getColor() == lightPink) { checkWinCount++; }
    }
  }
  
  else if (level == 9) { //bigender pride flag
    for (int x = 0; x < num_of_col; x++) {  
      if (tile[0][x].getColor() == lavender) { checkWinCount++; }
      if (tile[5][x].getColor() == lavender) { checkWinCount++; }
      if (tile[1][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[4][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[2][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[3][x].getColor() == babyBlue) { checkWinCount++; }
    }
  }
  
  else if (level == 10) { //intersex pride flag
    if (tile[1][2].getColor() == purple) { checkWinCount++; }
    if (tile[1][3].getColor() == purple) { checkWinCount++; }
    if (tile[2][1].getColor() == purple) { checkWinCount++; }
    if (tile[2][4].getColor() == purple) { checkWinCount++; }
    if (tile[3][1].getColor() == purple) { checkWinCount++; }
    if (tile[3][4].getColor() == purple) { checkWinCount++; }
    if (tile[4][2].getColor() == purple) { checkWinCount++; }
    if (tile[4][3].getColor() == purple) { checkWinCount++; }
   
    for (int y = 0; y < num_of_row; y++) {
      for (int x = 0; x < num_of_col; x++) {
        if (tile[y][x].getColor() == yellow) { checkWinCount++; }
      }
    }
  }
  
  else if (level == 11) { //bear pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == black) { checkWinCount++; }
      if (tile[1][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[2][x].getColor() == lightOrange) { checkWinCount++; }
      if (tile[3][x].getColor() == yellow) { checkWinCount++; }
      if (tile[4][x].getColor() == orange) { checkWinCount++; }
      if (tile[5][x].getColor() == brown) { checkWinCount++; }
    }
  }
  
  else if (level == 12) { //lipstick lesbian pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == darkRed) { checkWinCount++; }
      if (tile[1][x].getColor() == lightRed) { checkWinCount++; }
      if (tile[2][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[3][x].getColor() == violet) { checkWinCount++; }
      if (tile[4][x].getColor() == darkViolet) { checkWinCount++; }
      if (tile[5][x].getColor() == purple) { checkWinCount++; }
    }
  }
  
  else if (level == 13) { //twink pride flag
    for (int x = 0; x < num_of_col; x++) {
      if (tile[0][x].getColor() == lightYellow) { checkWinCount++; }
      if (tile[1][x].getColor() == lightYellow) { checkWinCount++; }
      if (tile[2][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[3][x].getColor() == lightGray) { checkWinCount++; }
      if (tile[4][x].getColor() == lightPink) { checkWinCount++; }
      if (tile[5][x].getColor() == lightPink) { checkWinCount++; }
    }
  }
  
  else if (level == 14) { //straight ally pride flag
    if (tile[0][0].getColor() == purple) { checkWinCount++; }
    if (tile[0][1].getColor() == purple) { checkWinCount++; }
    if (tile[0][2].getColor() == lightGray) { checkWinCount++; }
    if (tile[0][4].getColor() == purple) { checkWinCount++; }
    if (tile[0][5].getColor() == purple) { checkWinCount++; }
    if (tile[1][0].getColor() == blue) { checkWinCount++; }
    if (tile[1][1].getColor() == blue) { checkWinCount++; }
    if (tile[1][2].getColor() == black) { checkWinCount++; }
    if (tile[1][3].getColor() == black) { checkWinCount++; }
    if (tile[1][4].getColor() == blue) { checkWinCount++; }
    if (tile[1][5].getColor() == blue) { checkWinCount++; }
    if (tile[2][0].getColor() == lightGray) { checkWinCount++; }
    if (tile[2][1].getColor() == green) { checkWinCount++; }
    if (tile[2][2].getColor() == green) { checkWinCount++; }
    if (tile[2][3].getColor() == green) { checkWinCount++; }
    if (tile[2][4].getColor() == green) { checkWinCount++; }
    if (tile[2][5].getColor() == lightGray) { checkWinCount++; }
    if (tile[3][0].getColor() == black) { checkWinCount++; }
    if (tile[3][1].getColor() == yellow) { checkWinCount++; }
    if (tile[3][2].getColor() == yellow) { checkWinCount++; }
    if (tile[3][3].getColor() == yellow) { checkWinCount++; }
    if (tile[3][4].getColor() == yellow) { checkWinCount++; }
    if (tile[3][5].getColor() == black) { checkWinCount++; }
    if (tile[4][0].getColor() == lightGray) { checkWinCount++; }
    if (tile[4][1].getColor() == lightGray) { checkWinCount++; }
    if (tile[4][2].getColor() == orange) { checkWinCount++; }
    if (tile[4][3].getColor() == orange) { checkWinCount++; }
    if (tile[4][4].getColor() == lightGray) { checkWinCount++; }
    if (tile[4][5].getColor() == lightGray) { checkWinCount++; }
    if (tile[5][0].getColor() == black) { checkWinCount++; }
    if (tile[5][1].getColor() == black) { checkWinCount++; }
    if (tile[5][2].getColor() == red) { checkWinCount++; }
    if (tile[5][3].getColor() == red) { checkWinCount++; }
    if (tile[5][4].getColor() == black) { checkWinCount++; }
    if (tile[5][5].getColor() == black) { checkWinCount++; }
  }
  
  if (checkWinCount == 35) { return true; }
  return false;
}