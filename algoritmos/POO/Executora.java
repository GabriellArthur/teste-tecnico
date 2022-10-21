public class Executora {
  public static void main(String[] args) {
    int opcoes, opcoesAnimal;

    do {
      opcoes = View.solicitarInt("1 - Mamifero\n2 - Ave\n0 - Sair");
      do {
        if (opcoes == 1) { // Mamifero
          opcoesAnimal = View.solicitarInt("1 - Cavalo\n2 - Gato\n3 - Cao\n4 - Elefante\n0 - Sair");
          switch (opcoesAnimal) {
            case 1:
              Cavalo cavalo = new Cavalo(300.0, 4);
              View.exibirMensagem("Peso: " + cavalo.getPeso() + " Qtd Patas: " + cavalo.getQtdPatas() + "\n");
              cavalo.comer();
              cavalo.andar();
              break;
            case 2:
              Gato gato = new Gato(4.0, 4);
              View.exibirMensagem("Peso: " + gato.getPeso() + " Qtd Patas: " + gato.getQtdPatas() + "\n");
              gato.comer();
              gato.andar();
              break;
            case 3:
              Cao cao = new Cao(5.0, 4);
              View.exibirMensagem("Peso: " + cao.getPeso() + " Qtd Patas: " + cao.getQtdPatas() + "\n");
              cao.atacar();
              cao.comer();
              cao.andar();
              break;
            case 4:
              Elefante elefante = new Elefante(4.0, 4);
              View.exibirMensagem("Peso: " + elefante.getPeso() + " Qtd Patas: " + elefante.getQtdPatas() + "\n");
              elefante.comer();
              elefante.andar();
              break;
          }
        }
        if (opcoes == 2) { // Ave
          opcoesAnimal = View.solicitarInt("1 - Pato\n2 - Galinha\n3 - Andorinha\n0 - Sair");
          switch (opcoesAnimal) {
            case 1:
              Pato pato = new Pato(1.0, 2);
              View.exibirMensagem("Peso: " + pato.getPeso() + " Qtd Patas: " + pato.getQtdPatas() + "\n");
              pato.voar();
              pato.comer();
              pato.andar();
              break;
            case 2:
              Galinha galinha = new Galinha(1.0, 2);
              View.exibirMensagem("Peso: " + galinha.getPeso() + " Qtd Patas: " + galinha.getQtdPatas() + "\n");
              galinha.comer();
              galinha.andar();
              break;
            case 3:
              Andorinha andorinha = new Andorinha(1.0, 2);
              View.exibirMensagem("Peso: " + andorinha.getPeso() + " Qtd Patas: " + andorinha.getQtdPatas() + "\n");
              andorinha.voar();
              andorinha.comer();
              andorinha.andar();
              break;
          }
        } else {
          opcoesAnimal = 0;
        }

      } while (opcoesAnimal != 0);
    } while (opcoes != 0);
  }
}