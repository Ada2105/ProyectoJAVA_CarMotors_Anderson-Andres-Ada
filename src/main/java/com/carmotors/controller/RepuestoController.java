package com.carmotors.controller;

import com.carmotors.model.Repuesto;
import com.carmotors.modelDAO.RepuestoDAO;
import com.carmotors.view.VistaRepuesto;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class RepuestoController {
    private VistaRepuesto vista;
    private RepuestoDAO dao;

    public RepuestoController(VistaRepuesto vista, RepuestoDAO dao) {
        this.vista = vista;
        this.dao = dao;

        this.vista.setGuardarListener(new GuardarListener());
        this.vista.setLimpiarListener(new LimpiarListener());
    }

    class GuardarListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            try {
                Repuesto repuesto = vista.getDatosFormulario();
                dao.agregarRepuesto(repuesto);
                vista.mostrarMensaje("Repuesto guardado correctamente.");
            } catch (Exception ex) {
                vista.mostrarMensaje("Error al guardar el repuesto: " + ex.getMessage());
            }
        }
    }

    class LimpiarListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            vista.setDatosFormulario(new Repuesto()); // Limpia el formulario
        }
    }
}
