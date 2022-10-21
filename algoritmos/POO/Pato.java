public class Pato extends Ave implements Voo {
  Voo voo;
  Double peso;
  Integer qtdPatas;

  public Pato(Double peso, Integer qtdPatas) {
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
    View.exibirMensagem("Pato comendo");
  }

  @Override
  public void andar() {
    View.exibirMensagem("Pato Andando");
  }

  @Override
  public void voar() {
    View.exibirMensagem("Pato Voando");
  }
}