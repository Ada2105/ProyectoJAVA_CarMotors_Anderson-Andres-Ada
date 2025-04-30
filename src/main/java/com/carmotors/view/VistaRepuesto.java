/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.carmotors.view;

/**
 *
 * @author ANDRES
 */
import com.carmotors.model.Repuesto;
import javax.swing.*;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class VistaRepuesto extends JFrame {
    private JTextField txtNombre, txtTipo, txtMarca, txtModelo;
    private JFormattedTextField txtFecha;
    private JButton btnGuardar, btnLimpiar;

    public VistaRepuesto() {
        setTitle("Gestión de Repuestos");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        initComponents();
        layoutComponents();
    }

    private void initComponents() {
        txtNombre = new JTextField(20);
        txtTipo = new JTextField(15);
        txtMarca = new JTextField(15);
        txtModelo = new JTextField(20);
        txtFecha = new JFormattedTextField(new SimpleDateFormat("dd/MM/yyyy"));
        txtFecha.setValue(new Date());
        btnGuardar = new JButton("Guardar");
        btnLimpiar = new JButton("Limpiar");
    }

    private void layoutComponents() {
        JPanel panel = new JPanel(new GridLayout(7, 2, 5, 5));
        
        panel.add(new JLabel("Nombre:"));
        panel.add(txtNombre);
        panel.add(new JLabel("Tipo:"));
        panel.add(txtTipo);
        panel.add(new JLabel("Marca:"));
        panel.add(txtMarca);
        panel.add(new JLabel("Modelo Compatible:"));
        panel.add(txtModelo);
        panel.add(new JLabel("Vida Útil Estimada:"));
        panel.add(txtFecha);
        panel.add(btnGuardar);
        panel.add(btnLimpiar);

        add(panel);
    }

    // Métodos para el controlador
    public void setGuardarListener(java.awt.event.ActionListener listener) {
        btnGuardar.addActionListener(listener);
    }

    public void setLimpiarListener(java.awt.event.ActionListener listener) {
        btnLimpiar.addActionListener(listener);
    }

    public Repuesto getDatosFormulario() {
        Repuesto r = new Repuesto();
        r.setNombre(txtNombre.getText());
        r.setTipo(txtTipo.getText());
        r.setMarca(txtMarca.getText());
        r.setModeloCompatible(txtModelo.getText());
        r.setVidaUtilEstimada((java.util.Date) txtFecha.getValue());
        return r;
    }

    public void setDatosFormulario(Repuesto repuesto) {
        txtNombre.setText(repuesto.getNombre());
        txtTipo.setText(repuesto.getTipo());
        txtMarca.setText(repuesto.getMarca());
        txtModelo.setText(repuesto.getModeloCompatible());
        txtFecha.setValue(repuesto.getVidaUtilEstimada());
    }

    public void mostrarMensaje(String mensaje) {
        JOptionPane.showMessageDialog(this, mensaje);
    }
}
