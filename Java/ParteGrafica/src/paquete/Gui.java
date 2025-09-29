package paquete;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.Color;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Gui extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTextField textoEntrada;
	private JTextField textoSalida;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Gui frame = new Gui();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Gui() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 584, 352);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		JLabel titulo = new JLabel("Mi primer APP");
		titulo.setForeground(new Color(128, 0, 255));
		titulo.setFont(new Font("Tahoma", Font.PLAIN, 18));
		titulo.setBounds(187, 10, 186, 46);
		contentPane.add(titulo);

		textoEntrada = new JTextField();
		textoEntrada.setBounds(287, 85, 168, 46);
		contentPane.add(textoEntrada);
		textoEntrada.setColumns(10);

		JLabel texto = new JLabel("inserte su nombre");
		texto.setForeground(new Color(128, 0, 255));
		texto.setFont(new Font("Tahoma", Font.PLAIN, 18));
		texto.setBounds(24, 85, 186, 46);
		contentPane.add(texto);

		JButton boton = new JButton("Calcular");
		boton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String nombre = textoEntrada.getText();
				if (textoEntrada.getText().equalsIgnoreCase("")) {
					textoSalida.setText("Debe escribir su nombre");
				} else {

					textoSalida.setText(nombre);
					textoEntrada.setText(null);
				}

			}
		});
		boton.setBounds(187, 161, 159, 46);
		contentPane.add(boton);

		textoSalida = new JTextField();
		textoSalida.setBounds(176, 230, 197, 39);
		contentPane.add(textoSalida);
		textoSalida.setColumns(10);

	}
}
