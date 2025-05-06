/*問題画面の罫線の描画をするpdeファイル*/


void  ruled_line1()  //横方向の罫線の描画する関数
{
  int l_range = centerX - (r * ( 5 + (H_nline/2) + 1));  //罫線の左端のx座標を設定
  int r_range = centerX + (r * (H_nline/2) + r/2);       //罫線の右端のx座標を設定

  for (int i = 0; i <= V_nline; i++) {
    int y = centerY - (r*(V_nline/2) + r/2) + r*i;  //罫線のy座標を設定
    line(l_range, y, r_range, y);                   //罫線の描画
  }
}

void  ruled_line2()  //縦方向の罫線の描画する関数
{
  int top_range = centerY - (r * ( 5 + (V_nline/2) + 1));  //罫線の上端のy座標を設定
  int buttom_range = centerY + (r * (V_nline/2) + r/2);    //罫線の下端のy座標を設定

  for (int i = 0; i <= H_nline; i++) {
    int x = centerX - (r*(H_nline/2) + r/2) + r*i;  //罫線のx座標を設定
    line(x, top_range, x, buttom_range);            //罫線の描画
  }
}
