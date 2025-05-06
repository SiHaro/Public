/*問題の罫線で囲まれた各ブロックの黒塗りか白塗りか×のいずれかの操作するクラスのpdeファイル*/

class Paint
{
  boolean B_flag;  //黒塗りをしているかどうかを示す真偽値
  boolean X_flag;  //×を描画しているかどうかを示す真偽値

  Paint(int i, int j)  //初期化用のコンストラクタ
  {
    B_flag = false;
    X_flag = false;
    answer[i][j] = false;
  }

  void B_X(int i, int j)  //黒塗りか白塗りか×のいずれか描画するクラス内関数
  {
    frameRate(7);  //通常だと早いためframeRateを遅くする
    if (mousePressed) {  //マウスのいずれかのボタンが押された
      if ((B_flag == true || X_flag == true) && (mouseButton == LEFT || mouseButton == RIGHT)) {  //黒塗りか×が描画されていくときに左右どちらかのマウスのボタンが押された
        White(i, j);      //後述の白塗する関数White()の実行
        //白塗りの設定にB_flag,X_flagを変更
        B_flag = false;
        X_flag = false;
        answer[i][j] = false;
      } else if (mouseButton == LEFT) {  //マウスの左ボタンが押された
        B_Paint(i, j);         //後述の黒塗りする関数B_Paint()の実行
        B_flag = !B_flag;      //黒塗りの設定にB_flagを変更
        answer[i][j] = true;   //回答格納真偽値answer(グローバル変数)の該当の位置を黒塗りに変更
      } else if (mouseButton == RIGHT) {  //マウスの右ボタンが押された
        X_Paint(i, j);         //後述の×を描画する関数X_paint()の実行
        X_flag = !X_flag;      //×を描画するの設定にX_flagを変更
      }
    }
  }
}


void B_Paint(int i, int j)  //黒塗りをする関数
{
  rect(q_select[i][j].Bx-(r/2), q_select[i][j].By-(r/2), r, r);
}

void X_Paint(int i, int j)  //×を描画する関数
{
  textSize(Fsize);
  text("X", q_select[i][j].Bx, q_select[i][j].By);
}

void White(int i, int j)    //白塗りをする関数
{
  fill(255);                                                         //白色に描画すように変更
  rect(q_select[i][j].Bx-(r/2), q_select[i][j].By-(r/2), r, r);
  fill(0);                                                           //黒色に描画すように戻す
}
