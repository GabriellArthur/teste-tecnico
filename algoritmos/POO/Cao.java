public class Cao extends Mamifero {
  Double peso;
  Integer qtdPatas;

  public Cao(Double peso, Integer qtdPatas) {
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

  public void atacar() {
    View.exibirMensagem("Cão possui a função de atacar");
  }

  @Override
  public void comer() {
    View.exibirMensagem("Cão comendo");
  }

  @Override
  public void andar() {
    View.exibirMensagem("Cão Andando");
  }
}
