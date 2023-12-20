import React from "react";
import Card from "react-bootstrap/Card";
import { ImPointRight } from "react-icons/im";

function AboutCard() {
  return (
    <Card className="quote-card-view">
      <Card.Body>
        <blockquote className="blockquote mb-0">
          <p style={{ textAlign: "justify" }}>
            Olá a todos, eu sou <span className="purple">Lucas Santana Santos </span>
            de <span className="purple"> São Paulo, Brasil.</span>
            <br />
            Atualmente sou estudante da UFABC no curso de Ciência da Computação e estou procurando por um emprego.
            <br />
            <br />
            Me interesso por computação desde pequeno, e a cada dia que passa crio novos objetivos pessoais para alcançar a liberdade que almejo na criação de soluções digitais.
            <br />
            <br />
            Graças à essa motivação, consegui aprender bastante sobre programação nos últimos anos e inclusive consegui publicar um App na Play Store! Esse é só o começo...
            <br />
            <br />
            Existem outras coisas que também gosto de fazer
          </p>
          
          <ul>
            <li className="about-activity">
              <ImPointRight /> Jogar com amigos
            </li>
            <li className="about-activity">
              <ImPointRight /> Viajar
            </li>
            <li className="about-activity">
              <ImPointRight /> Escutar músicas, sempre estou escutando músicas 😅
            </li>
          </ul>

          <p style={{ color: "rgb(0, 255, 255)" }}>
            "O único modo de fazer um ótimo trabalho é amar o que você faz."{" "}
          </p>
          <footer className="purple">- Steve Jobs</footer>
        </blockquote>
      </Card.Body>
    </Card>
  );
}

export default AboutCard;
