/*ヒントに関する処理をすべて実行するクラスのpdeファイル*/
/*問題1～6の行数や列数は異なるため行、列それぞれにあったクラス内関数を使用する*/

class Hints
{
  int n_hints;      //各行または各列の描画するヒントの数を格納する変数
  int textX;        //各列のヒントを描画する際のx座標を格納する変数
  int textY;        //各行のヒントを描画する際のy座標を格納する変数
  
  Hints()  //初期化用のコンストラクタ
  {
    n_hints = 0; 
  }

  void v_hint0(int h)  //各列に描画するヒント数を数える
  {
    if (TF[0][h] == true) n_hints++;                                    //解答格納真偽値TF(グローバル変数)が始めから黒塗りする際に、n_hintsを+1する
    for (int i = 1; i < V_nline; i++) {
      if ((TF[i][h] == true) && (TF[i][h] == !TF[i-1][h])) n_hints++;   //解答格納真偽値TF(グローバル変数)が1以上空けて黒塗りする際に、n_hintsを+1する
    }
  }

  void  v_hints(int h)  //各列に描画するヒントの数字を決めて描画することをv_hint0()で決めた回数繰り返す
  {
    textX = (centerX - (H_nline/2)*r) + r * h;  //textXを更新
    int j = 0;                                  //何列まで処理を行ったのかを記憶しておく変数
    for (int i = n_hints - 1; i >= 0; i--) {  //左から右にヒントを描画するためi--にする
      boolean flagH = false;  //ヒントを描画したかどうかを示す真偽値(v_hintsが1以上のときに特に重要)
      for (int n = 0; (flagH == false)&&(j < V_nline); j++) {
        if (TF[j][h] == true) {  //解答格納真偽値TFが黒塗りである
          n++;
        }
        if ((TF[j][h] == false) && (j > 0) && (TF[j][h] == !TF[j-1][h]) || ((TF[j][h] == true) && (j==V_nline - 1))) {  //ヒントを描画する条件である
          int Y = (centerY - r*(V_nline/2+1)) - r*i;  //h行目のn_hints - i個目の描画するヒントのy座標を設定
          text(n, textX, Y);                          //n_hints - i個目のヒントの数字ｎの描画
          n = 0;                                     //ヒントの数字nを初期化
          flagH = !flagH;                            //ヒントを描画したことを示す
        }
      }
    }
    if (n_hints == 0) {  //ヒント数が0である
      text(n_hints, textX, centerY - r*(V_nline/2+1));  //本来、1つ目のヒントの数字を表示する位置に0を表示
    }
  }

  void h_hint0(int v)  //各行ｖに描画するヒント数を数える
  {
    if (TF[v][0] == true) n_hints++;                                    //解答格納真偽値TF(グローバル変数)が始めから黒塗りする際に、n_hintsを+1する
    for (int i = 1; i < H_nline; i++) {
      if ((TF[v][i] == true) && (TF[v][i] == !TF[v][i-1]))n_hints++;    //解答格納真偽値TF(グローバル変数)が1以上空けて黒塗りする際に、n_hintsを+1する
    }
  }

  void  h_hints(int v)  //各行に描画するヒントの数字を決めて描画することをv_hint0()で決めた回数繰り返す
  {
    textY = (centerY - (V_nline/2)*r) + r * v;  //textYを更新
    int j = 0;                                  //何行まで処理を行ったのかを記憶しておく変数
    for (int i = n_hints - 1; i >= 0; i--) {  //上から下にヒントを描画するためi--にする
      boolean flagH = false;  //ヒントを描画したかどうかを示す真偽値(h_hintsが1以上のときに特に重要)
      for (int n = 0; (flagH == false)&&(j < H_nline); j++) {
        if (TF[v][j] == true) {  //解答格納真偽値TFが黒塗りである
          n++;
        }
        if ((TF[v][j] == false) && (j > 0) && (TF[v][j] == !TF[v][j-1]) || ((TF[v][j] == true) && (j==H_nline - 1))) {
          int X = (centerX - r*(H_nline/2+1)) - r*i;  //v列目目のn_hints - i個目の描画するヒントのｘ座標を設定
          text(n, X, textY);                          //n_hints - i個目のヒントの数字ｎの描画
          n = 0;                                      //ヒントの数字nを初期化
          flagH = !flagH;                            //ヒントを描画したことを示す
        }
      }
    }
    if (n_hints == 0) {  //ヒント数が0である
      text(n_hints, centerX - r*(H_nline/2+1), textY);  //本来、1つ目のヒントの数字を表示する位置に0を表示
    }
  }
}
