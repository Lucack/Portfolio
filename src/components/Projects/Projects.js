import React from "react";
import { Container, Row, Col } from "react-bootstrap";
import ProjectCard from "./ProjectCards";
import Particle from "../Particle";
import leaf from "../../Assets/Projects/leaf.png";
import emotion from "../../Assets/Projects/emotion.png";
import editor from "../../Assets/Projects/codeEditor.png";
import cris from "../../Assets/Projects/cris.png";
import ponggame from "../../Assets/Projects/ponggame.png";
import bouncegame from "../../Assets/Projects/bouncegame.png";

import suicide from "../../Assets/Projects/suicide.png";
import bitsOfCode from "../../Assets/Projects/blog.png";

function Projects() {
  return (
    <Container fluid className="project-section">
      <Particle />
      <Container>
        <h1 className="project-heading">
          Meus <strong className="purple"> Projetos </strong>
        </h1>
        <p style={{ color: "white" }}>
          Aqui temos alguns dos projetos que trabalhei recentemente.
        </p>
        <Row style={{ justifyContent: "center", paddingBottom: "10px" }}>
          <Col md={4} className="project-card">
            <ProjectCard
              imgPath={cris}
              isBlog={true}
              title="Cris' Adventures"
              description="Um jogo educativo desenvolvido em poucos dias com a ajuda de amigos para fazer as artes e design. Postado oficialmente na Play Store e disponível para todas plataformas pelo link abaixo."
              // ghLink="https://github.com/soumyajit4419/Chatify"
              demoLink="https://lucack.itch.io/cris-adventures"
              android="https://play.google.com/store/apps/details?id=com.godot.crisadventures"
            />
            
    
          </Col>

          <Col md={4} className="project-card">
          <ProjectCard
              imgPath={ponggame}
              isBlog={false}
              title="Pong Game"
              description="Meu segundo jogo desenvolvido em Python utilizando Kivy, 2 jogadores. Disponível para Android! "
              // ghLink="https://github.com/soumyajit4419/Chatify"
              demoLink="https://lucack.itch.io/pong-game"
              
            />
            </Col>

            <Col md={4} className="project-card">
          <ProjectCard
              imgPath={bouncegame}
              isBlog={false}
              title="Bounce Game"
              description="Meu primeiro jogo desenvolvido do zero em Python utilizando Tkinter. Disponível para Windows! "
              // ghLink="https://github.com/soumyajit4419/Chatify"
              demoLink="https://lucack.itch.io/bounce-game"
              
            />
            </Col>
          

          
        </Row>
      </Container>
    </Container>
    
  );
}

export default Projects;
