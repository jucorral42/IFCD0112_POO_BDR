package preguntas_respuestas;

import javax.swing.JOptionPane;

public class Preguntas_respuestas {

	public static void main(String[] args) {

		int seleccion = JOptionPane.showOptionDialog(null, "¿Te gusta mi app?", "Pregunta",
				JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE, null,
				new Object[] { "Siiiii", "Nooooo", "Cancelar" }, "Siiiii");
		if (seleccion == 0) {
			JOptionPane.showMessageDialog(null, "Muchas gracias", "Gracias",

					JOptionPane.INFORMATION_MESSAGE);

		} else if (seleccion == 1) {
			JOptionPane.showMessageDialog(null, "Seguiré mejorando", "Gracias",

					JOptionPane.ERROR_MESSAGE);

		} else {

			JOptionPane.showMessageDialog(null, "ns/nc", "Gracias", JOptionPane.INFORMATION_MESSAGE);

			
		}
	}
}
