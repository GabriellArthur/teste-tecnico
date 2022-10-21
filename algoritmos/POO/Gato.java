public class Gato extends Mamifero {
  Double peso;
  Integer qtdPatas;

  public Gato(Double peso, Integer qtdPatas) {
    super(peso, qtdPatas);
    this.peso = peso;
    this.qtdPatas = qtdPatas;
  }

  public Double getPeso() {
    return peso;
  }

  public Integer getQtdPatas() {
    return qtdPatas;
  }

  @Override
  public void comer() {
    View.exibirMensagem("Gato comendo");
  }

  @Override
  public void andar() {
    View.exibirMensagem("Gato Andando");
  }
}
