package herencia;
import java.awt.*;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.border.LineBorder;
public class Gastos extends JFrame {
public JPanel contentPane;
public JComboBox<String> combo1;
public static JTextField num1;
public JTextField num2;
public JTextField num3;
public JTextField num4;
public JTextField num5;
public JTextField num6;
public JButton btnGuardar, btnSalir;
public JLabel lblcargo, lblinicial, lblimporte, lblConsumo, lblFinal, lblObservaciones;
public String cargo, fechaini, fechafin, obser;
public int importe, consumo;
private JPanel Jpanel_facturas;
private JPanel Jpanel_consultas;
public static void main(String[] args) {
EventQueue.invokeLater(new Runnable() {
public void run() {
try {
Gastos frame = new Gastos();
frame.setVisible(true);
} catch (Exception e) {
e.printStackTrace();
}
}
});
}
public Gastos() {
setTitle("Control de Facturas");
setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
setBounds(100, 100, 640, 480);
contentPane = new JPanel();

contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
contentPane.setLayout(null);
contentPane.setVisible(true);
setContentPane(contentPane);
// tabbed pane
JTabbedPane tabbedPane = new JTabbedPane();
tabbedPane.setBorder(new LineBorder(new Color(0, 0, 128), 1, true));
//Controlamos el tamaño del Tabbedpane para los hijos
tabbedPane.setBounds(0, 11, 632, 86);
contentPane.add(tabbedPane);
// primer panel
Jpanel_facturas = new JPanel();
Jpanel_facturas.setLayout(null);
// COMBO OPCIONES
combo1 = new JComboBox<String>();
combo1.setEditable(true);
combo1.setVisible(true);
combo1.setBounds(10, 11, 313, 35);
Jpanel_facturas.add(combo1);
combo1.addItem(" TIPO DE GASTO");
combo1.addItem(" LUZ");
combo1.addItem(" GAS");
combo1.addItem(" AGUA");
combo1.addItem(" TELEFONO");
combo1.addItem(" MOVIL");
combo1.addItem(" HIPOTECA");
combo1.addItem(" PRESTAMOS");
combo1.addItem(" COMUNIDAD");
combo1.addItem(" VISA");
combo1.addItem(" OTROS");
// Seleccionamos la opción
combo1.addItemListener(new ItemListener() {
public void itemStateChanged(ItemEvent e) {
String seleccionado = (String) combo1.getSelectedItem();
if (seleccionado.equals(" LUZ")) {
new Luz().setVisible(true);
}
}
});
tabbedPane.addTab("Facturas", null, Jpanel_facturas, null);
// segundo panel vacío
Jpanel_consultas = new JPanel();
tabbedPane.addTab("Consultas", null, Jpanel_consultas, null);
}
}

