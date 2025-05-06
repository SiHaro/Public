/* マウスのクリックした際の処理や処理の起こる範囲を定義しているクラスのpdeファイル*/
/*主にボタンの機能を持たせるために使用*/

class r_mouse
{
  int leftX;    //ボタンの左端の値
  int rightX;   //ボタンの右端の値
  int topY;     //ボタンの上端の値
  int buttomY;  //ボタンの下端の値

  int Bx;        //ボタンの中心のx座標
  int By;        //ボタンの中心のy座標
  int B_width;   //ボタンの横幅
  int B_height;  //ボタンの縦幅


  r_mouse(int x, int y, int w1, int h1)  //初期化用のコンストラクタ
  {
    leftX = x - (w1/2);
    rightX = x + (w1/2);
    topY = y - (h1/2);
    buttomY = y + (h1/2);
    Bx = x;
    By = y;
    B_width = w1;
    B_height = h1;
  }

  void H_mouse(int v, int h)  //ホーム画面のマウス設定
  {
    Button(Bx, By, B_width, B_height, home[4*v + h]);  //ホーム画面のボタンの枠とボタンの名前の描画
    if ((mouseX >= leftX) && (mouseX <= rightX) && (mouseY >= topY) && (mouseY <= buttomY)) {//mouseXとmouseYがボタンの枠の範囲内にある
      flag = 4*v + h;                        //flag(グローバル変数)の格納
      if (flag == 7) flag = (int)random(1, 7);       //ランダムという名前のボタンの際、1～6の値をランダムに代入

      if ((mousePressed) && (mouseButton == LEFT)) { //マウスの左ボタンが押された
        /*このif文内の処理ほぼ全体が問題画面のsetup処理*/
        collect_in();                              //該当するflag(グローバル変数)処理をする関数を実行(COLLECT.pde内の関数)
        if (flag == 0) return ;                    //flag == 0は表示切り替えボタンのためここで終了
        HOME = !HOME;                              //ホーム画面モードから問題画面モードに変更(draw()で特に重要)
        q_select = new r_mouse[V_nline][H_nline];  //グローバル変数q_selectの宣言(このクラス)
        BXW = new Paint[V_nline][H_nline];         //グローバル変数BXWの宣言(BXW_paint.pde内のクラス)
        hh = new Hints[H_nline];                   //グローバル変数hhの宣言(HINTS_paint.pde内のクラス)
        vh = new Hints[V_nline];                   //グローバル変数vhの宣言(HINTS_paint.pde内のクラス)
        background(255);                           //背景を白で描画してリセット

        for (int i = 0; i < V_nline; i++) {
          for (int j = 0; j < H_nline; j++) {
            q_select[i][j] = new r_mouse(centerX + r*(j+(0 - H_nline/2)), centerY + r*(i+(0 - V_nline/2)), r, r);  //罫線で囲われた正方形のブロックそれぞれのマウスの範囲をコンストラタ(後述のQ_mouse()で使用)
            BXW[i][j] =  new Paint(i, j);                                                                                //q_selectのそれぞれの黒塗り、×の描画するための設定をコンストラクタ(BXW_paint.pde内のクラス)
            hh[j] = new Hints();                                                                                         //各行の描画するヒント数を初期化するクラスのコンストラクタ(HINTS_paint.pde内のクラス)
            hh[j].v_hint0(j);                                                                                            //各行の描画するヒント数をクラス内変数に記憶する(HINTS_paint.pde内のクラス関数)
            vh[i] = new Hints();                                                                                         //各列の描画するヒント数を初期化するクラスのコンストラクタ(HINTS_paint.pde内のクラス)
            vh[i].h_hint0(i);                                                                                            //各列の描画するヒント数をクラス内変数に記憶する(HINTS_paint.pde内のクラス関数)
          }
        }
      }
    }
  }

  void Q_mouse(int i, int j)  //問題画面のマウス設定(正誤判定ボタン、終了ボタンは後述のjudgButton(),void finishButton()でそれぞれ設定)
  {
    if ((mouseX >= leftX) && (mouseX <= rightX) && (mouseY >= topY) && (mouseY <= buttomY))  //mouseXとmouseYがq_select内の指定された範囲内にある
      BXW[i][j].B_X(i, j);  //黒塗りか白塗りか×を描画するクラスPaint内の関数の実行(BXW_paint.pde内のクラス内関数)
  }

  void judgButton()  //正誤判定ボタンのマウス設定
  {
    int x1 = 1300;
    int y1 = 300;
    Button(x1, y1, 300, 300, "");                           //後述のjudg_Click()内の〇か×を描画するための枠を描画
    Button(Bx, By, B_width, B_height, "正誤判定");          //正誤判定ボタンの枠と文字を描画
    if ((mouseX >= leftX) && (mouseX <= rightX) && (mouseY >= topY) && (mouseY <= buttomY)) {  //mouseXとmouseYが正誤判定ボタンがsetup()で指定された範囲内にある
      if ((mouseButton == LEFT))    //マウスの左ボタンが押された(mousePressedがないことで長く表示させることができる)
        judg_Click(x1, y1);   //後述の正誤判定とその結果を表示する関数の実行
    }
  }

  void finishButton()  //終了ボタンのマウス設定
  {
    Button( Bx, By, B_width, B_height, "終了"); //終了ボタンの枠と文字を描画
    if ((mouseX >= leftX) && (mouseX <= rightX) && (mouseY >= topY) && (mouseY <= buttomY)) {  //mouseXとmouseYが正誤判定ボタンがsetup()で指定された範囲内にある
      if ((mousePressed) && (mouseButton == LEFT)) //マウスの左ボタンが押された
        HOME =!HOME;    //問題画面モードからホーム画面モードに変更(draw()で特に重要)
    }
  }
}

void judg_Click(int x1, int y1)  //正誤判定の処理をする関数
{
  boolean t = true;  //正誤判定の結果を格納しておく真偽値
  for (int i = 0; i < V_nline; i++) {
    for (int j = 0; j < H_nline; j++) {
      if (answer[i][j] != TF[i][j]) {  //回答用真偽値answerが解答格納真偽値TF(グローバル変数)と等しくない
        t = false;  //正誤判定を偽にする。
      }
    }
  }

  if ( t == true) {                                    //正誤判定が真である
    textSize(300);              //描画する〇の大きさを設定
    fill(255, 0, 0);            //描画する〇の色を赤に設定
    text("〇", x1, y1 - 50);    //〇の描画
    fill(0);                    //描画の色を黒に戻す
  } else {                                            //正誤判定が偽である
    textSize(400);              //描画する×の大きさを設定
    fill(0, 0, 255);            //描画する×の色を赤に設定
    text("×", x1, y1 - 80);    //×の描画
    fill(0);                    //描画の色を黒に戻す
  }
  textSize(30);                 //描画する文字の大きさを30に戻す
}

void Button(int x, int y, int  w1, int h1, String a)  //ボタンの枠線とボタンの文字の描画をする関数
{
  fill(255);                            //枠線にするために色を白に設定
  rect(x-(w1/2), y-(h1/2), w1, h1);     //ボタンの中心がx,yになるように長方形を描画
  fill(0);                              //描画の色を黒に戻す
  text(a, x, y);                        //ボタンの中心にaに格納された文字を描画
}
