package com.carmotors.controller;

import com.carmotors.model.Repuesto;
import com.carmotors.modelDAO.RepuestoDAO;
import com.carmotors.view.PanelRepuesto;
import javax.swing.JOptionPane;

public class RepuestoController {
    private PanelRepuesto vista;
    private RepuestoDAO repuestoDAO;

    public RepuestoController(PanelRepuesto vista, RepuestoDAO repuestoDAO) {
        this.vista = vista;
        this.repuestoDAO = repuestoDAO;
        this.vista.setGuardarListener(e -> guardarRepuesto());
    }

    private void guardarRepuesto() {
        Repuesto repuesto = vista.getDatosFormulario();
        if (repuesto != null) { // Verifica si se obtuvieron los datos correctamente
            try {
                boolean guardadoExitoso = repuestoDAO.agregar(repuesto);

                if (guardadoExitoso) {
                    JOptionPane.showMessageDialog(vista, "Repuesto guardado correctamente");
                    vista.limpiarFormulario();
                } else {
                    JOptionPane.showMessageDialog(vista, "No se pudo guardar el repuesto");
                }

            } catch (Exception e) {
                JOptionPane.showMessageDialog(vista, "Error al guardar en la base de datos: " + e.getMessage());
                // Aquí capturas errores de la base de datos, no de la validación del formulario
            }
        }
        // Si repuesto es null, significa que hubo un error en el formulario (precio o tipo inválido)
        // El mensaje de error ya se mostró en getDatosFormulario()
    }


    public void cargarRepuesto(Repuesto repuesto) {
        if (repuesto != null) {
            vista.setDatosFormulario(repuesto);
        }
    }

    public void limpiarFormulario() {
        vista.limpiarFormulario();
    }
}

