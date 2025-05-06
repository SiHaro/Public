/*メインの実行を行うpdeファイル*/


void setup()  //セットアップ関数
{
  size(1500, 800);                        //画面のサイズを設定
  strokeWeight(2);                        //ボタンの枠線の大きさを設定
  textAlign(CENTER, CENTER);              //テキストを真んなか中心に変更
  PFont font = createFont("Meiryo", 50);  //日本語出力の準備
  textFont(font);                         //テキストフォントを日本語に変更

  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 4; j++) {
      h_select[4*i+j] = new r_mouse(200 + 370*((4*i+j)- 4*i), 350 + 230*i, 300, 200);  //ホーム画面のボタンの範囲を決めるための設定を実行
    }
  }

  judge = new r_mouse(1200, 700, 120, 40);    //問題画面の正誤判定ボタンの範囲を決めるための設定を実行
  finish = new r_mouse(1400, 700, 100, 40);   //問題画面の終了ボタンの範囲を決めるための設定を実行
}

void draw()  //繰り返し処理関数
{
  if (HOME == true) {  //ホーム画面の設定
    background(255);                        //背景を白にする
    textSize(100);                          //テキストサイズをNonoの文字に合ったものに変更
    text("N  o  N  o", width/2, 100);       //Nonoの文字を描画
    text_select();                          //関数text_select()を実行(COLLECT.pde内の関数)
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 4; j++) {
        textSize(30);                      //テキストサイズをボタンに合ったものに変更
        if (HOME == false) break;          //どこかのボタンが押されたら後の処理を無視する(この処理がないとボタンを押した以降の処理が残ってしまう)
        h_select[4*i + j].H_mouse(i, j);   //ボタンの描画をマウスが押されるまで繰り返す。
      }
    }
  } else {  //問題画面の設定
    textSize(Fsize);  //テキストサイズを押されたボタンの種類に合うものに変更
    for (int i = 0; i < V_nline; i++) {
      for (int j = 0; j < H_nline; j++) {
        hh[j].v_hints(j);  //縦方向のヒントを描画
        vh[i].h_hints(i);  //横方向のヒントを描画
      }
    }
    ruled_line1();            //横方向の罫線の描画
    ruled_line2();            //縦方向の罫線の描画
    textSize(30);             //テキストサイズを正誤判定ボタンと終了ボタンに合ったものに変更
    judge.judgButton();       //正誤判定ボタンボタンの描画をマウスが押されるまで繰り返す。
    finish.finishButton();    //終了ボタンの描画をマウスが押されるまで繰り返す。
    for (int i = 0; i < V_nline; i++) {
      for (int j = 0; j < H_nline; j++) {
        q_select[i][j].Q_mouse(i, j);  //罫線で囲まれたブロックが押されるまで待機
      }
    }
  }
}
