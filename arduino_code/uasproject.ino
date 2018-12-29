
int trigPin = 11;    // Trigger
int echoPin = 12;    // Echo
int duration, cm, inches;

void setup() {
  //Serial Port begin
  Serial.begin (9600);
//Define inputs and outputs
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}
void loop() {
// Sensor dipicu oleh pulsa TINGGI sebanyak 10 mikrodetik atau lebih. 
// Berikan pulsa RENDAH pendek sebelumnya untuk memastikan denyut TINGGI yang bersih:
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
 digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

// Baca sinyal dari sensor: pulsa TINGGI yang 
// durasi adalah waktu (dalam mikrodetik) dari pengiriman 
// dari ping ke penerimaan gema dari objek.
  pinMode(echoPin, INPUT);
  duration = pulseIn(echoPin, HIGH);

  // Ubah waktu menjadi jarak
  cm = (duration/2) / 29.1 ;     // Bagilah dengan 29,1 atau kalikan dengan 0,0343
  inches = (duration/2) / 74;   // Bagilah dengan 74 atau kalikan dengan 0,0135
  
//  Serial.println(duration);
  Serial.println(cm);
  
  delay(1000);
}
