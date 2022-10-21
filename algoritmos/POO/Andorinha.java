public class Andorinha extends Ave implements Voo  {
  Voo voo;
  Double peso;
  Integer qtdPatas;

  public Andorinha(Double peso, Integer qtdPatas) {
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
    View.exibirMensagem("Andorinha comendo");
  }

  @Override
  public void andar() {
    View.exibirMensagem("Andorinha Andando");
  }

  @Override
  public void voar() {
    View.exibirMensagem("Andorinha Voando");
  }
}
