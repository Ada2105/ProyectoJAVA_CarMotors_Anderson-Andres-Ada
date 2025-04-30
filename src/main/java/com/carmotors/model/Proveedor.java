/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.carmotors.model;

/**
 *
 * @author ANDRES
 */
public class Proveedor {
    private Integer id;
    private String nombre;
    private String nit;
    private String coctacto;
    private Integer frecuenciaVisitas;   

    public Proveedor() {
    }

    public Proveedor(Integer id, String nombre, String nit, String coctacto, Integer frecuenciaVisitas) {
        this.id = id;
        this.nombre = nombre;
        this.nit = nit;
        this.coctacto = coctacto;
        this.frecuenciaVisitas = frecuenciaVisitas;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getCoctacto() {
        return coctacto;
    }

    public void setCoctacto(String coctacto) {
        this.coctacto = coctacto;
    }

    public Integer getFrecuenciaVisitas() {
        return frecuenciaVisitas;
    }

    public void setFrecuenciaVisitas(Integer frecuenciaVisitas) {
        this.frecuenciaVisitas = frecuenciaVisitas;
    }

    @Override
    public String toString() {
        return "Proveedor{" + "id=" + id + ", nombre=" + nombre + ", nit=" + nit + ", coctacto=" + coctacto + ", frecuenciaVisitas=" + frecuenciaVisitas + '}';
    }
    
    
}
