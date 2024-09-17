package OOP_concepts;
public class Monstro extends Personagem{
    private String tipo;
    private int poderAtaque;
    private String habilidade;
    
    public Monstro(String cor, String tipo, int poderAtaque, String habilidade){
        super(cor);
        this.tipo = tipo;
        this.poderAtaque = poderAtaque;
        this.habilidade = habilidade;
    }
    
    public void atacar(Jogador jogador){
        if(jogador.sofrerDano(this.poderAtaque))
            this.poderAtaque += 1;
    }
}
