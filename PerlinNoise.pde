float strength = 1100.0;  //ノイズの強さ
int step = 2;             //グリッドの細かさ
float noiseScale = 0.002; //パーリンノイズのスケール

void setup(){
  size(720, 1280);
  background(0);
  noLoop();
}

void draw(){
  blendMode(ADD); //加算して発光表現
  noFill();
  
  //2次元のパーリンノイズをベジェ曲線で描画
  for(int row = -height*5; row < height*5; row += step){
    beginShape();
    for(int col = -width/2; col < width*1.5; col += step){
      for (int i = 1; i < 5; i++) {
        smooth(8);
        strokeWeight(i);
        stroke(map(i, 1, 50, 30, 90), 80, map(i, 1, 50, 150, 200), 50);
        float noise = noise(col * noiseScale, row * noiseScale) * strength;
        curveVertex(col, row + noise + (col * 0.5));
      }
    }
    endShape();
  }
  save("frame/PerlinNoise.jpg");
}
