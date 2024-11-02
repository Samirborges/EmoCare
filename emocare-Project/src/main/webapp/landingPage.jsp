<%-- 
    Document   : landingPage
    Created on : 2 de nov. de 2024, 13:40:11
    Author     : Davi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Landing Page</title>
        <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            scroll-behavior: smooth;
        }

        .section {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 2.0s ease, transform 2.0s ease;
        }

        .section.fade-in {
            opacity: 2;
            transform: translateY(0);
        }
             
        #section1 {
            background-color: #9BDAA6;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #section2 {
            background-color: #fce8e3;
        }

        #section3 {
            background-color: #e9d8fc;
        }

        h1, h2 {
            color: #522e23;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #f4c4db;
            color: #522e23;
            font-size: 1.2em;
            border-radius: 10px;
            text-decoration: none;
        }

        .content {
            max-width: 1000px;
            display: flex;
            justify-content: space-between;
        }

        .box {
            background-color: #fffbe6;
            border-radius: 15px;
            padding: 20px;
            width: 60%;
            height: 500px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px;
        }

        img {
            border-radius: 15px;
        }

        .comments {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .comment-box {
            background-color: #fdf0f7;
            border-radius: 15px;
            padding: 20px;
            margin: 10px;
            width: 80%;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .comment-row {
            display: flex;
            justify-content: space-between;
            width: 100%; 
        }

        .horizontal-rectangle {
            background-color: #F7F3EA;
            width: 50%;
            height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: flex-start;
            border-radius: 15px;
            padding: 20px;
            margin-right: 20px;
        }

        .section1-content {
            text-align: left;
            color: #522e23;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .section1-content h1 {
            font-size: 3em;
            margin-top: 0;
            display: flex;
            align-items: center;
        }

        .section1-content h1 img {
            width: 30px;
            margin-left: 10px;
        }

        .section1-content p {
            font-size: 3em;
            line-height: 1.4;
            margin-top: 10px;
        }

        .action-btn {
            align-self: flex-start;
            margin-top: auto;
            padding: 12px 25px;
            background-color: #fdcae5;
            color: #522e23;
            font-size: 1.2em;
            border-radius: 10px;
            text-decoration: none;
            cursor: pointer;
        }

        #section1 img {
            width: 30%;
            border-radius: 10px;
            margin-left: 20px;
        }
    </style>
    </head>
    <body>
        <!-- Seção 1: Imagem Inicial e Retângulo -->
    <div id="section1" class="section">
        <div class="horizontal-rectangle">
            <div class="section1-content">
                <h1>Bem-vindo ao EmoCare <img src="imagens/Logo.png" alt="Logo EmoCare" style="width: 130px; margin-left: 0;"></h1>

                <p>Transforme a sua vida<br>Se liberte de suas dores</p>
                <a onclick="window.location.href='cadastro.jsp'" class="action-btn"><strong>Agende sua consulta</strong></a>
            </div>
        </div>
        <img src="imagens/teste.png" alt="Imagem Inicial">
    </div>

    <!-- Seção 2: Sobre a Terapia -->
    <div id="section2" class="section">
        <div>
            <h1>Sobre a Terapia</h1>
            <div class="content">
                <div class="box">
                    <img src="imagens/Dores.png" alt="Dores" style="width: 100%;">
                    <h2>Dores</h2>
                    <p>Com técnicas avançadas que não aborda apenas os sintomas, mas também a raiz do problema, agindo diretamente nas memórias traumáticas, promovendo uma transformação profunda.</p>
                </div>
                <div class="box">
                    <img src="imagens/Sucesso.png" alt="Sucesso" style="width: 100%;">
                    <h2>Sucesso</h2>
                    <p>As abordagens são personalizadas para atender as necessidades individuais, criando um caminho de cura adaptada a cada pessoa.</p>
                </div>              
                <div class="box">
                    <img src="imagens/Plenitude.png" alt="Plenitude" style="width: 100%;">
                    <h2>Plenitude</h2>
                    <p>Venha ter uma vida plena com nossa terapia emocional que irá ajudar a você ter uma vida mais saudável e ter momentos incríveis com sua família.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Seção 3: Comentários -->
    <div id="section3" class="section">
        <div>
            <h1>Comentários</h1>
            <div class="comments">
                <div class="comment-box">
                    <p>A terapia me ajudou bastante a estabelecer uma relação saudável com a minha família...</p>
                    <a href="#" class="btn"><strong>Ler Mais</strong></a>
                </div>
                <div class="comment-row">
                    <div class="comment-box">
                        <p>Tive sucesso graças à terapia por ter me libertado das amarras do passado...</p>
                        <a href="#" class="btn"><strong>Ler Mais</strong></a>
                    </div>
                    <div class="comment-box">
                        <p>Esse tratamento teve um grande impacto na minha vida...</p>
                        <a href="#" class="btn"><strong>Ler Mais</strong></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function checkVisibility() {
            const sections = document.querySelectorAll('.section');
            const windowHeight = window.innerHeight;

            sections.forEach(section => {
                const sectionTop = section.getBoundingClientRect().top;
                
                if (sectionTop < windowHeight - 50) {
                    section.classList.add('fade-in');
                } else {
                    section.classList.remove('fade-in');
                }
            });
        }

        window.addEventListener('scroll', checkVisibility);
        window.addEventListener('load', checkVisibility);
    </script>

    </body>
</html>
