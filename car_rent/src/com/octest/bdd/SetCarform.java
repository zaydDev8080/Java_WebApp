package com.octest.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.octest.beans.Formulaire;

public class SetCarform {
    private Connection connexion;
    
    public List<Formulaire> recupererVoiture() {
        List<Formulaire> Form1 = new ArrayList<Formulaire>();
        Statement statement = null;
       
        ResultSet resultat = null;
       
        loadDatabase();
        
        try {
            statement = connexion.createStatement();

            // Exécution de la requête
            resultat = statement.executeQuery("select immatriculation, modele, kilometrage, Etat  from voiture;");

            // Récupération des données
            while (resultat.next()) {
                String immatriculation = resultat.getString("immatriculation");
                String modele = resultat.getString("modele");
                String kilometrage = resultat.getString("kilometrage");
                String Etat = resultat.getString("Etat");
                
                
                
                Formulaire formule1 = new Formulaire();
                formule1.setImmatriculation(immatriculation);
                formule1.setModele(modele);
                formule1.setKilometrage(kilometrage);
                formule1.setEtat(Etat);
                
                
                Form1.add(formule1);
            }
        } catch (SQLException e) {
        } finally {
            // Fermeture de la connexion
            try {
                if (resultat != null)
                    resultat.close();
                if (statement != null)
                    statement.close();
                if (connexion != null)
                    connexion.close();
            } catch (SQLException ignore) {
            }
        }
        
        return Form1;
    }

    private void loadDatabase() {
        // Chargement du driver
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3308/javaee?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    

    public void ajouterVoiture(Formulaire Form) {
        loadDatabase();
         /// select immatriculation, modele, kilometrage, Etat  from voiture
        try {
            PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO voiture (immatriculation, modele,kilometrage,Etat) VALUES(?, ?, ?, ?);");
            preparedStatement.setString(1, Form.getImmatriculation());
            preparedStatement.setString(2, Form.getModele());
            preparedStatement.setString(3, Form.getKilometrage());
            preparedStatement.setString(4, Form.getEtat());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
}