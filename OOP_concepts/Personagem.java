package OOP_concepts;
import java.util.Random;

public class Personagem {
    protected int saude;
    protected String cor;
    protected int nivel;
    protected int velocidade;
    
    public Personagem(String cor){
        this.saude = 100;
        this.cor = cor;
        this.nivel = 1;
        this.velocidade = 0;
    }

    public void mostrarEstado(){
        System.out.println("Resumo: \nSaúde: " + this.saude + "\nCor: " + this.cor + "\nNível: " + this.nivel +  "\nVelocidade: " + this.velocidade);
    }

    public boolean sofrerDano(int dano){
        Random numAleatorio = new Random();
        int numero = numAleatorio.nextInt(101);
        if(this.saude > 0 && numero >= 50){
            this.saude -= dano;
            return true;
        }
        
        return false;
    }
}
