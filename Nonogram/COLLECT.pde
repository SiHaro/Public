/*正解の格納や各設定をまとめているpdeファイル*/
/*基本的に変更があるときにはこのpdeファイルを変更すればいいようになっている*/

void text_select()  //ホーム画面のボタンの中心に描画する文字列を決める関数
{
  if (mode == false) {  //問題番号表示モードの設定(デフォルト)
    home[0] = "答えの表示";
    home[1] = "1";
    home[2] = "2";
    home[3] = "3";
    home[4] = "4";
    home[5] = "5";
    home[6] = "6";
    home[7] = "ランダム";
  } else {            //答え表示モードの設定
    home[0] = "問題番号に戻す";
    home[1] = "ローマ数字2";
    home[2] = "ローマ数字4";
    home[3] = "ローマ数字6";
    home[4] = "ローマ数字8";
    home[5] = "ローマ数字10";
    home[6] = "ローマ数字12";
    //モードによって変わらないためhome[7]は変更しない
  }
}

void F_in()  //後述で使用する解答格納真偽値TF(グローバル変数)がtrue以外のとき、falseを格納する関数
{
  for (int i = 0; i < V_nline; i++) {
    for (int j = 0; j < H_nline; j++) {
      if (TF[i][j] == true) break;  //trueのときには、後ろの処理を無視
      TF[i][j] = false;   //falseを格納
    }
  }
}

void collect_in()  //ホーム画面のボタンそれぞれの設定をする関数
{
  switch(flag) {
  case 0:  //モード変更ボタンの設定
    frameRate(5);  //通常だと早いためframeRateを遅くする
    mode = !mode;  //モードを変更する
    break;
  case 1:  //問題１ボタンの設定
    //V_nline*H_nlineの問題でFsizeでヒントを描画して、罫線で囲まれたr*rのブロックを(centerX, centerY)を中心となるように設定する
    H_nline = 7;
    V_nline = 9;
    Fsize = 40;
    r = 60;
    centerX = width/2 - 80;
    centerY = height/2 + 100;
    TF = new boolean[V_nline][H_nline];
    //黒塗りをする位置のみtrueで初期化
    TF[1][1] = true;
    TF[1][2] = true;
    TF[1][3] = true;
    TF[1][4] = true;
    TF[1][5] = true;
    TF[2][2] = true;
    TF[2][4] = true;
    TF[3][2] = true;
    TF[3][4] = true;
    TF[4][2] = true;
    TF[4][4] = true;
    TF[5][2] = true;
    TF[5][4] = true;
    TF[6][2] = true;
    TF[6][4] = true;
    TF[7][1] = true;
    TF[7][2] = true;
    TF[7][3] = true;
    TF[7][4] = true;
    TF[7][5] = true;
    break;
  case 2:  //問題2ボタンの設定
    //V_nline*H_nlineの問題でFsizeでヒントを描画して、罫線で囲まれたr*rのブロックを(centerX, centerY)を中心となるように設定する
    H_nline = 15;
    V_nline = 9;
    Fsize = 40;
    r = 60;
    centerX = width/2 - 100;
    centerY = height/2 + 100;
    TF = new boolean[V_nline][H_nline];
    //黒塗りをする位置のみtrueで初期化
    TF[1][1] = true;
    TF[1][2] = true;
    TF[1][3] = true;
    TF[1][5] = true;
    TF[1][6] = true;
    TF[1][7] = true;
    TF[1][11] = true;
    TF[1][12] = true;
    TF[1][13] = true;
    TF[2][2] = true;
    TF[2][6] = true;
    TF[2][12] = true;
    TF[3][2] = true;
    TF[3][6] = true;
    TF[3][12] = true;
    TF[4][2] = true;
    TF[4][6] = true;
    TF[4][7] = true;
    TF[4][11] = true;
    TF[4][12] = true;
    TF[5][2] = true;
    TF[5][7] = true;
    TF[5][11] = true;
    TF[6][2] = true;
    TF[6][7] = true;
    TF[6][8] = true;
    TF[6][10] = true;
    TF[6][11] = true;
    TF[7][1] = true;
    TF[7][2] = true;
    TF[7][3] = true;
    TF[7][8] = true;
    TF[7][9] = true;
    TF[7][10] = true;
    break;
  case 3:  //問題3ボタンの設定
    //V_nline*H_nlineの問題でFsizeでヒントを描画して、罫線で囲まれたr*rのブロックを(centerX, centerY)を中心となるように設定する
    H_nline = 15;
    V_nline = 9;
    Fsize = 40;
    r = 60;
    centerX = width/2 - 100;
    centerY = height/2 + 100;
    TF = new boolean[V_nline][H_nline];
    //黒塗りをする位置のみtrueで初期化
    TF[1][1] = true;
    TF[1][2] = true;
    TF[1][3] = true;
    TF[1][7] = true;
    TF[1][8] = true;
    TF[1][9] = true;
    TF[1][11] = true;
    TF[1][12] = true;
    TF[1][13] = true;
    TF[2][2] = true;
    TF[2][8] = true;
    TF[2][12] = true;
    TF[3][2] = true;
    TF[3][8] = true;
    TF[3][12] = true;
    TF[4][2] = true;
    TF[4][3] = true;
    TF[4][7] = true;
    TF[4][8] = true;
    TF[4][12] = true;
    TF[5][3] = true;
    TF[5][7] = true;
    TF[5][12] = true;
    TF[6][3] = true;
    TF[6][4] = true;
    TF[6][6] = true;
    TF[6][7] = true;
    TF[6][12] = true;
    TF[7][4] = true;
    TF[7][5] = true;
    TF[7][6] = true;
    TF[7][11] = true;
    TF[7][12] = true;
    TF[7][13] = true;
    break;
  case 4:  //問題4ボタンの設定
    //V_nline*H_nlineの問題でFsizeでヒントを描画して、罫線で囲まれたr*rのブロックを(centerX, centerY)を中心となるように設定する
    H_nline = 19;
    V_nline = 9;
    Fsize = 35;
    r = 45;
    centerX = width/2 - 100;
    centerY = height/2 + 100;
    TF = new boolean[V_nline][H_nline];
    //黒塗りをする位置のみtrueで初期化
    TF[1][1] = true;
    TF[1][2] = true;
    TF[1][3] = true;
    TF[1][7] = true;
    TF[1][8] = true;
    TF[1][9] = true;
    TF[1][11] = true;
    TF[1][12] = true;
    TF[1][13] = true;
    TF[1][14] = true;
    TF[1][15] = true;
    TF[1][16] = true;
    TF[1][17] = true;
    TF[2][2] = true;
    TF[2][8] = true;
    TF[2][12] = true;
    TF[2][14] = true;
    TF[2][16] = true;
    TF[3][2] = true;
    TF[3][8] = true;
    TF[3][12] = true;
    TF[3][14] = true;
    TF[3][16] = true;
    TF[4][2] = true;
    TF[4][3] = true;
    TF[4][7] = true;
    TF[4][8] = true;
    TF[4][12] = true;
    TF[4][14] = true;
    TF[4][16] = true;
    TF[5][3] = true;
    TF[5][7] = true;
    TF[5][12] = true;
    TF[5][14] = true;
    TF[5][16] = true;
    TF[6][3] = true;
    TF[6][4] = true;
    TF[6][6] = true;
    TF[6][7] = true;
    TF[6][12] = true;
    TF[6][14] = true;
    TF[6][16] = true;
    TF[7][4] = true;
    TF[7][5] = true;
    TF[7][6] = true;
    TF[7][11] = true;
    TF[7][12] = true;
    TF[7][13] = true;
    TF[7][14] = true;
    TF[7][15] = true;
    TF[7][16] = true;
    TF[7][17] = true;
    break;
  case 5: //問題5ボタンの設定
    //V_nline*H_nlineの問題でFsizeでヒントを描画して、罫線で囲まれたr*rのブロックを(centerX, centerY)を中心となるように設定する
    H_nline = 9;
    V_nline = 11;
    Fsize = 40;
    r = 50;
    centerX = width/2 - 100;
    centerY = height/2 + 100;
    TF = new boolean[V_nline][H_nline];
    //黒塗りをする位置のみtrueで初期化
    TF[1][1] = true;
    TF[1][2] = true;
    TF[1][3] = true;
    TF[1][5] = true;
    TF[1][6] = true;
    TF[1][7] = true;
    TF[2][2] = true;
    TF[2][6] = true;
    TF[3][2] = true;
    TF[3][3] = true;
    TF[3][5] = true;
    TF[3][6] = true;
    TF[4][3] = true;
    TF[4][4] = true;
    TF[4][5] = true;
    TF[5][4] = true;
    TF[6][3] = true;
    TF[6][4] = true;
    TF[6][5] = true;
    TF[7][2] = true;
    TF[7][3] = true;
    TF[7][5] = true;
    TF[7][6] = true;
    TF[8][2] = true;
    TF[8][6] = true;
    TF[9][1] = true;
    TF[9][2] = true;
    TF[9][3] = true;
    TF[9][5] = true;
    TF[9][6] = true;
    TF[9][7] = true;
    break;
  case 6: //問題6ボタンの設定
    //V_nline*H_nlineの問題でFsizeでヒントを描画して、罫線で囲まれたr*rのブロックを(centerX, centerY)を中心となるように設定する
    H_nline = 15;
    V_nline = 11;
    Fsize = 40;
    r = 50;
    centerX = width/2 - 100;
    centerY = height/2 + 100;
    TF = new boolean[V_nline][H_nline];
    //黒塗りをする位置のみtrueで初期化
    TF[1][1] = true;
    TF[1][2] = true;
    TF[1][3] = true;
    TF[1][5] = true;
    TF[1][6] = true;
    TF[1][7] = true;
    TF[1][9] = true;
    TF[1][10] = true;
    TF[1][11] = true;
    TF[1][12] = true;
    TF[1][13] = true;
    TF[2][2] = true;
    TF[2][6] = true;
    TF[2][10] = true;
    TF[2][12] = true;
    TF[3][2] = true;
    TF[3][3] = true;
    TF[3][5] = true;
    TF[3][6] = true;
    TF[3][10] = true;
    TF[3][12] = true;
    TF[4][3] = true;
    TF[4][4] = true;
    TF[4][5] = true;
    TF[4][10] = true;
    TF[4][12] = true;
    TF[5][4] = true;
    TF[5][10] = true;
    TF[5][12] = true;
    TF[6][3] = true;
    TF[6][4] = true;
    TF[6][5] = true;
    TF[6][10] = true;
    TF[6][12] = true;
    TF[7][2] = true;
    TF[7][3] = true;
    TF[7][5] = true;
    TF[7][6] = true;
    TF[7][10] = true;
    TF[7][12] = true;
    TF[8][2] = true;
    TF[8][6] = true;
    TF[8][10] = true;
    TF[8][12] = true;
    TF[9][1] = true;
    TF[9][2] = true;
    TF[9][3] = true;
    TF[9][5] = true;
    TF[9][6] = true;
    TF[9][7] = true;
    TF[9][9] = true;
    TF[9][10] = true;
    TF[9][11] = true;
    TF[9][12] = true;
    TF[9][13] = true;
    break;
    //ランダムボタンの設定は特にないため行わない
  }
  F_in();                                  //前述のF_in()を実行
  answer = new boolean[V_nline][H_nline];  //回答格納真偽値answer(グローバル変数)の大きさを宣言
}
