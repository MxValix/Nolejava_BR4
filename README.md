# <h1 align="center">Project Work JaNA 16 - Nolejava</h1>

![Logo NoleJava](https://raw.githubusercontent.com/MxValix/Nolejava_BR4/master/Nolejava/WebContent/images/logo-pdf.png)

## Dominio del problema
Si vuole realizzare una web application in Java per la gestione del noleggio dei veicoli di un **autonoleggio**. 
Tra i dati che devono essere registrati di ogni **automobile**, ci sono: un codice identificativo, la marca della casa costruttrice, il modello, il numero di posti, la targa, la cilindrata, il colore, il tipo di cambio (se automatico o manuale), il tipo di carburante (benzina, GPL, etc.) e la tipologia dell'automobile (berlina, sportiva, etc.). In particolare si richiede che il codice identificativo sia di tipo numerico e sia gestito dal sistema in auto-incremento ogni volta che una nuova automobile viene aggiunta all’autonoleggio. 
Quando un automobile viene noleggiata bisogna registrare i dati del noleggio comprensivi dei dati del **cliente** che ha effettuato il **noleggio** e dell'automobile scelta. 
I noleggi possono essere prenotati in anticipo, con l’indicazione del periodo (date di inizio e di scadenza del noleggio). 
Se un'automobile non è disponibile in un dato periodo, o l'autonoleggio nell'arco di periodo selezionato è chiuso, il cliente non potrà noleggiare l'auto.
L'archiviazione persistente dei dati che riguardano ciascun noleggio deve essere realizzata memorizzando i dati nel database MySQL, con la possibilità di recuperarli e manipolarli in ogni momento.
Ogni qualvolta un utente effettuerà la registrazione (che verrà poi confermata o rifiutata dall'**Amministratore** del Sistema, confermerà un noleggio o cancellerà un noleggio, la conferma di avvenuta operazione verrà notificata tramite email.

### Attori coinvolti
 - **Visitatore**: può sfogliare il parco auto, effettuare ricerche con i filtri combinati relativi alle informazioni delle automobili ed effettuare la registrazione al sistema ma non può prenotare automobile;
 - **Cliente**: una volta effettuato il login svolge tutte le funzionalità del visitatore (eccetto la registrazione) e può prenotare automobili in base alla disponibilità, previo inserimento dei dati relativi alla patente e carta di credito;
 - **Staff**: una volta effettuato il login, può accedere alla dashboard e vedere la lista delle auto inserite o inserirne una nuova, inoltre, può promuovere il **Cliente** a **Staff**.
 - **Amministratore**: una volta effettuato il login, oltre a svolgere tutte le funzionalità dello **Staff**, può accedere alla dashboard, modificare e cancellare automobili e noleggi, verificare e rimuovere gli utenti (staff e cliente), aggiungere giornate di ferie o chiusure aziendali al **Calendario Chiusure**.

### Tecnologie utilizzate
 - Web server:
![TomCat v.9.0](https://img.shields.io/badge/Apache%20Tomcat-%209.0-yellowgreen)
 - Database:
  ![MySQL 5.7](https://img.shields.io/badge/MySQL-5.7-blue)
  - Back-end:
![Hibernate 5.3.6](https://img.shields.io/badge/Hibernate-5.3.6-green) ![Java SE8](https://img.shields.io/badge/Java-SE8-orange) ![Servlet](https://img.shields.io/badge/Servlet-JSR%20340-blue)
  - Front-end:
![JSP](https://img.shields.io/badge/JSP-Java%20Server%20Pages-yellow) ![HTML 5](https://img.shields.io/badge/HTML-5-red) ![CSS 3](https://img.shields.io/badge/CSS-3-blue) ![Bootstrap 4.0](https://img.shields.io/badge/Bootstrap-4.0-purple) ![JavaScript ECMA 6](https://img.shields.io/badge/JavaScript-ECMA%206-yellow) ![JQuery 3.5.1](https://img.shields.io/badge/JQuery-3.5.1-blue)
