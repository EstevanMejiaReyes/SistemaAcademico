package modelo;

public class Calificacion {
    private int calificacionId;
    private int estudianteId;
    private int componenteEvaluacionId;
    private double nota;
    private String comentarios;

    public Calificacion() {}

    public Calificacion(int calificacionId, int estudianteId, int componenteEvaluacionId,
                        double nota, String comentarios) {
        this.calificacionId = calificacionId;
        this.estudianteId = estudianteId;
        this.componenteEvaluacionId = componenteEvaluacionId;
        this.nota = nota;
        this.comentarios = comentarios;
    }

    public int getCalificacionId() { return calificacionId; }
    public void setCalificacionId(int calificacionId) { this.calificacionId = calificacionId; }

    public int getEstudianteId() { return estudianteId; }
    public void setEstudianteId(int estudianteId) { this.estudianteId = estudianteId; }

    public int getComponenteEvaluacionId() { return componenteEvaluacionId; }
    public void setComponenteEvaluacionId(int componenteEvaluacionId) { this.componenteEvaluacionId = componenteEvaluacionId; }

    public double getNota() { return nota; }
    public void setNota(double nota) { this.nota = nota; }

    public String getComentarios() { return comentarios; }
    public void setComentarios(String comentarios) { this.comentarios = comentarios; }
}
