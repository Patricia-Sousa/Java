package OOP_concepts;
public class Jogador extends Personagem{
    public enum Arma { PISTOLA, CACADEIRA, METRALHADORA; }
    
    private int experiencia;
    private Arma armaAtual;
    
    public Jogador(String cor, Arma arma){
        super(cor);
        this.experiencia = 10;
        this.armaAtual = arma;        
    }
    
    public void ganharExperiencia(){
        this.experiencia += 1;
    }
    
    public int calcularDano(){
        switch(this.armaAtual){
            case PISTOLA:
                return 2;
            case CACADEIRA:
                return 4;
            case METRALHADORA:
                return 10;
            default:
                return 0;
        }            
    }
    
    public void atacar(Monstro monstro){
        if(super.saude <= 0)
            System.out.println("O jogador não pode atacar pois não tem saúde.");
    
        if(monstro.sofrerDano(calcularDano()))
            this.ganharExperiencia();
    }
}
