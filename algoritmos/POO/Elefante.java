public class Elefante extends Mamifero {
  Double peso;
  Integer qtdPatas;

  public Elefante(Double peso, Integer qtdPatas) {
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
    View.exibirMensagem("Elefante Possui uma forma diferente de comer dos demais animais");
  }

  @Override
  public void andar() {
    View.exibirMensagem("Elefante Andando");
  }
}
