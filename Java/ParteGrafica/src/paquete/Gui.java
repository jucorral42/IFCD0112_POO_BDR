package paquete;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
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
	private JTextField tfEntrada;
	private JTextField tfSalida;
	private JTextField tfEdad;
	private JLabel titulo;
	private JLabel lbNombre;
	private JLabel lbEdad;
	private JButton bcalcualr;

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

		titulo = new JLabel("Mi primer APP");
		titulo.setForeground(new Color(128, 0, 255));
		titulo.setFont(new Font("Tahoma", Font.PLAIN, 18));
		titulo.setBounds(187, 10, 186, 46);
		contentPane.add(titulo);

		tfEntrada = new JTextField();
		tfEntrada.setBounds(291, 57, 168, 46);
		contentPane.add(tfEntrada);
		tfEntrada.setColumns(10);

		lbNombre = new JLabel("inserte su nombre");
		lbNombre.setForeground(new Color(128, 0, 255));
		lbNombre.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lbNombre.setBounds(23, 53, 186, 46);
		contentPane.add(lbNombre);

		bcalcualr = new JButton("Calcular");
		bcalcualr.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String nombre = tfEntrada.getText();
				String edad = tfEdad.getText();
				if (tfEntrada.getText().equalsIgnoreCase("")|| tfEdad.getText().equals("")) {
					tfSalida.setText("Debe escribir su nombre y o su edad");
					tfSalida.setBorder(new LineBorder(new Color (255,0,0)));
				} else {

					tfSalida.setText(nombre+ "   " + edad);
					tfEntrada.setText(null);
					tfEdad.setText(null);
				}

			}
		});
		bcalcualr.setBounds(187, 165, 159, 46);
		contentPane.add(bcalcualr);

		tfSalida = new JTextField();
		tfSalida.setBounds(176, 230, 197, 39);
		contentPane.add(tfSalida);
		tfSalida.setColumns(10);

		lbEdad = new JLabel("inserte su edad");
		lbEdad.setForeground(new Color(128, 0, 255));
		lbEdad.setFont(new Font("Tahoma", Font.PLAIN, 18));
		lbEdad.setBounds(23, 109, 186, 46);
		contentPane.add(lbEdad);

		tfEdad = new JTextField();
		tfEdad.setColumns(10);
		tfEdad.setBounds(291, 113, 168, 46);
		contentPane.add(tfEdad);

	}
}
