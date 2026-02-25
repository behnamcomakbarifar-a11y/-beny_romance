import 'security/encrypter.dart';

void main() {
  String original = "دوستت دارم بنی";
  
  print("--- Encryption Test ---");
  String encrypted = BenyEncrypt.encode(original);
  print("🔒 Encrypted: $encrypted");

  String decrypted = BenyEncrypt.decode(encrypted);
  print("🔓 Decrypted: $decrypted");

  if (original == decrypted) {
    print("\n✅ Encryption Layer: SUCCESS");
  } else {
    print("\n❌ Encryption Layer: FAILED");
  }
}
