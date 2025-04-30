/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.carmotors.model;
import java.util.Date;
/**
 *
 * @author ANDRES
 */
public class Prueba {
    
 
    public static void main(String[] args) {
        // ========== CREACIÓN DE OBJETOS BÁSICOS ==========
        // Crear un proveedor
        Proveedor proveedor1 = new Proveedor();
        proveedor1.setId(1);
        proveedor1.setNombre("Autopartes del Norte S.A.");
        proveedor1.setNit("123456789-0");
        proveedor1.setCoctacto("Carlos Méndez - 3001234567");
        proveedor1.setFrecuenciaVisitas(15); // días

        // Crear un repuesto
        Repuesto repuesto1 = new Repuesto();
        repuesto1.setId(101);
        repuesto1.setNombre("Filtro de aceite");
        repuesto1.setTipo("Filtros");
        repuesto1.setMarca("Bosch");
        repuesto1.setModeloCompatible("Toyota Hilux 2015-2020");
        repuesto1.setVidaUtilEstimada(new Date(124, 11, 31)); // 31/Dic/2024

        // ========== CREACIÓN DE LOTE Y ASOCIACIONES ==========
        // Crear un lote asociado al repuesto y proveedor
        Lote lote1 = new Lote();
        lote1.setId(1001);
        lote1.setRepuesto(repuesto1);
        lote1.setProveedor(proveedor1);
        lote1.setFechaIngreso(new Date());
        lote1.setCantidadInicial(50);
        lote1.setCantidadDisponible(50);
        lote1.setEstado(EstadoLote.DISPONIBLE);

        // ========== PRUEBAS DE ASOCIACIONES ==========
        System.out.println("=== INFORMACIÓN DEL LOTE ===");
        System.out.println("Lote ID: " + lote1.getId());
        System.out.println("Estado: " + lote1.getEstado().toString());
        System.out.println("Cantidad: " + lote1.getCantidadDisponible() + "/" + lote1.getCantidadInicial());
        System.out.println("Fecha ingreso: " + lote1.getFechaIngreso());
        
        System.out.println("\n=== REPUESTO ASOCIADO ===");
        System.out.println("Nombre: " + lote1.getRepuesto().getNombre());
        System.out.println("Marca: " + lote1.getRepuesto().getMarca());
        System.out.println("Modelo compatible: " + lote1.getRepuesto().getModeloCompatible());
        
        System.out.println("\n=== PROVEEDOR ASOCIADO ===");
        System.out.println("Nombre: " + lote1.getProveedor().getNombre());
        System.out.println("Contacto: " + lote1.getProveedor().getCoctacto());
        System.out.println("Frecuencia de visitas: cada " + lote1.getProveedor().getFrecuenciaVisitas() + " días");

        // ========== PRUEBA DE CAMBIO DE ESTADO ==========
        System.out.println("\n=== CAMBIANDO ESTADO DEL LOTE ===");
        System.out.println("Estado actual: " + lote1.getEstado());
        lote1.setEstado(EstadoLote.RESERVADO);
        System.out.println("Nuevo estado: " + lote1.getEstado());

        // ========== PRUEBA DE REDUCCIÓN DE INVENTARIO ==========
        System.out.println("\n=== ACTUALIZANDO INVENTARIO ===");
        int cantidadUsada = 7;
        lote1.setCantidadDisponible(lote1.getCantidadDisponible() - cantidadUsada);
        System.out.println("Se usaron " + cantidadUsada + " unidades. Nuevo stock: " + lote1.getCantidadDisponible());
        
        // ========== VERIFICACIÓN DE INTEGRIDAD ==========
        System.out.println("\n=== VERIFICANDO INTEGRIDAD DE RELACIONES ===");
        System.out.println("¿El repuesto del lote es 'Filtro de aceite'? " + 
            (lote1.getRepuesto().getNombre().equals("Filtro de aceite") ? "✓" : "✗"));
        
        System.out.println("¿El proveedor del lote es 'Autopartes del Norte S.A.'? " + 
            (lote1.getProveedor().getNombre().equals("Autopartes del Norte S.A.") ? "✓" : "✗"));
    }
}
   
