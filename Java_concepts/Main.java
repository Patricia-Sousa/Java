package Java_concepts;
public class Main {

    public static void main(String[] args) {
        Monstro monstro = new Monstro("Preto", "Feio", 10, "Correr");
        Jogador jogador1 = new Jogador("Branco", Jogador.Arma.PISTOLA);
        
        monstro.atacar(jogador1);
        monstro.mostrarEstado();
        jogador1.atacar(monstro);
        jogador1.mostrarEstado();        
    }
    
}
