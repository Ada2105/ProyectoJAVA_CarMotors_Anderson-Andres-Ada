/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.carmotors.view;

/**
 *
 * @author ANDRES
 */
import com.carmotors.modelDAO.RepuestoDAO;
import com.carmotors.view.VistaRepuesto;
import com.carmotors.controller.RepuestoController;

import javax.swing.SwingUtilities;

public class Main {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            VistaRepuesto vista = new VistaRepuesto();
            RepuestoDAO dao = new RepuestoDAO();
            new RepuestoController(vista, dao);
            vista.setVisible(true);
        });
    }
}