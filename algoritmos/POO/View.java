import javax.swing.JOptionPane;

public class View {
	
	static void exibirMensagem(String msg) {
		JOptionPane.showMessageDialog(null, msg);
	}
	
	static String solicitarString(String msg) {
		return JOptionPane.showInputDialog(msg);
	}
	
	static int solicitarInt(String msg) {
		String retorno= JOptionPane.showInputDialog(msg);
		return Integer.parseInt(retorno);
	}
	
	static void exibirErro(String erro) {
		JOptionPane.showMessageDialog(null, erro, "DEU RUIM" , JOptionPane.ERROR_MESSAGE);
	}
	
	static int continuacao(String msg) {
		return JOptionPane.showConfirmDialog(null, msg,"Continua��o",JOptionPane.YES_NO_OPTION);
	}
	
}
