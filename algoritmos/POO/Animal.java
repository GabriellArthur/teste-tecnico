public class Animal {
  Double peso;
  Integer qtdPatas;

  public Animal(Double peso, Integer qtdPatas) {
    this.peso = peso;
    this.qtdPatas = qtdPatas;
  }

  public void comer() {
    System.out.println("Animal comendo");
  }

  public void andar() {
    System.out.println("Animal andando");
  }
}
