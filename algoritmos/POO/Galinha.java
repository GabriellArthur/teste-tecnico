public class Galinha extends Ave {
  Double peso;
  Integer qtdPatas;

  public Galinha(Double peso, Integer qtdPatas) {
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
    View.exibirMensagem("Galinha Andando");
  }
}
  
