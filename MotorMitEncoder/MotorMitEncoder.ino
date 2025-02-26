#include <ESP32Encoder.h>

ESP32Encoder encoderLeft;
ESP32Encoder encoderRight;

// Motorkonfiguration
const int r1 = 14, r2 = 12, l1 = 26, l2 = 27, speedr = 13, speedl = 25;

unsigned long lastToggleTime;
int movementStage = 0; // 0 = vorwärts, 1 = rückwärts, 2 = links, 3 = rechts

void setup() {
    Serial.begin(115200);
    
    // Pull-up Widerstände für Encoder aktivieren
    ESP32Encoder::useInternalWeakPullResistors = puType::up;

    // Encoder für die Räder initialisieren
    encoderLeft.attachHalfQuad(34, 35);
    encoderRight.attachHalfQuad(32, 33);
    
    // Setze die Encoder-Werte auf 0
    encoderLeft.clearCount();
    encoderRight.clearCount();

    // Motor-Pins als Ausgänge definieren
    pinMode(r1, OUTPUT);
    pinMode(r2, OUTPUT);
    pinMode(l1, OUTPUT);
    pinMode(l2, OUTPUT);
    pinMode(speedr, OUTPUT);
    pinMode(speedl, OUTPUT);

    Serial.println("Encoder Startwerte: Links = " + String((int32_t)encoderLeft.getCount()) + " Rechts = " + String((int32_t)encoderRight.getCount()));
    
    lastToggleTime = millis();
}

// Funktion zur Motorsteuerung
void drive(int leftSpeed, int rightSpeed, bool leftForward, bool rightForward) {
    // Linker Motor
    digitalWrite(l1, leftForward ? HIGH : LOW);
    digitalWrite(l2, leftForward ? LOW : HIGH);
    analogWrite(speedl, abs(leftSpeed));

    // Rechter Motor
    digitalWrite(r1, rightForward ? HIGH : LOW);
    digitalWrite(r2, rightForward ? LOW : HIGH);
    analogWrite(speedr, abs(rightSpeed));
}

void stopMotors() {
    digitalWrite(l1, LOW);
    digitalWrite(l2, LOW);
    digitalWrite(r1, LOW);
    digitalWrite(r2, LOW);
    analogWrite(speedl, 0);
    analogWrite(speedr, 0);
}

void loop() {
    Serial.println("Encoder Werte: Links = " + String((int32_t)encoderLeft.getCount()) + ", Rechts = " + String((int32_t)encoderRight.getCount()));
    delay(500);

    if (millis() - lastToggleTime >= 5000) {  // Alle 5 Sekunden Bewegung ändern
        switch (movementStage) {
            case 0: // Vorwärtsfahren
                Serial.println("Beide Motoren vorwärts");
                drive(170, 170, true, true);
                break;
            case 1: // Rückwärtsfahren
                Serial.println("Beide Motoren rückwärts");
                drive(170, 170, false, false);
                break;
            case 2: // Links drehen
                Serial.println("Links stehen, rechts vorwärts");
                drive(170, 170, true, false);
                break;
            case 3: // Rechts drehen
                Serial.println("Rechts stehen, links vorwärts");
                drive(170, 170, false, true);
                break;
        }
        
        movementStage = (movementStage + 1) % 4; // Nächster Zustand
        lastToggleTime = millis();
    }
}
