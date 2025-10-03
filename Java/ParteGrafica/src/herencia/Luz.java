package herencia;
import java.awt.EventQueue;
import javax.swing.*;
import java.awt.Font;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
public class Luz extends Gastos {
private JButton bgastos;
private JLabel lgastos;
public Luz() { //Constructor del hijo
bgastos = new JButton("GASTOS");
bgastos.addActionListener(new ActionListener() {
public void actionPerformed(ActionEvent arg0) {
new Gastos().setVisible(true);
}
});
bgastos.setFont(new Font("Tahoma", Font.BOLD, 24));
bgastos.setBounds(315, 219, 225, 46);
getContentPane().add(bgastos);
lgastos = new JLabel("Pulsa aqu\u00ED para volver al PADRE");
lgastos.setHorizontalAlignment(SwingConstants.CENTER);
lgastos.setFont(new Font("Tahoma", Font.BOLD, 16));
lgastos.setBounds(10, 225, 295, 40);
getContentPane().add(lgastos);
}
public static void main(String[] args) {
EventQueue.invokeLater(new Runnable() {
public void run() {
try {
Luz frame = new Luz();
frame.setVisible(true);
} catch (Exception e) {
e.printStackTrace();
}
}
});
}
}
