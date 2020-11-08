package com.octest.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.octest.beans.Utilisateur;

public class Noms {
	private Connection connexion;

	public List<Utilisateur> recupererUtilisateurs() {
		
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		
		Statement statement = null;

		ResultSet resultat = null;

		loadDatabase();

		try {
			statement = connexion.createStatement();

			// Exécution de la requête
			resultat = statement.executeQuery("SELECT Login, password FROM user;");

			// Récupération des données
			while (resultat.next()) {
				String nom = resultat.getString("Login");
				String prenom = resultat.getString("password");

				Utilisateur utilisateur = new Utilisateur();
				utilisateur.setNom(nom);
				utilisateur.setPrenom(prenom);

				utilisateurs.add(utilisateur);
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

		return utilisateurs;
	}
	/*
	 * public static void main(String[] args) {
	 * 
	 * Noms test = new Noms();
	 * 
	 * System.out.println(true);
	 * 
	 * System.out.println(test.recupererUtilisateurs().);
	 * 
	 * 
	 * }
	 */

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
			System.out.println(">>> connection : "+connexion);
		}
	}

	/*
	 * public void ajouterUtilisateur(Utilisateur utilisateur) { loadDatabase();
	 * 
	 * try { PreparedStatement preparedStatement =
	 * connexion.prepareStatement("select  INTO user(Login, password) VALUES(?, ?);"
	 * ); preparedStatement.setString(1, utilisateur.getNom());
	 * preparedStatement.setString(2, utilisateur.getPrenom());
	 * 
	 * preparedStatement.executeUpdate(); } catch (SQLException e) {
	 * e.printStackTrace(); } }
	 */

	public int checkyuser(Utilisateur utilisateur) {
		loadDatabase();
		Statement statement2 = null;
		ResultSet resultat2 = null;
		int Value = 0;
		try {
			if(connexion == null) {
				System.out.println("null in connexion");
				return 0;
			}
			statement2 = connexion.createStatement();
			String nom =  utilisateur.getNom();
			String prenom = utilisateur.getPrenom();

			resultat2 = statement2.executeQuery(
					"SELECT Login, password FROM user where Login='" + nom + "' and password='" + prenom + "'");
		
			if (resultat2.next() == true) {
				Value = 1;
			} else {
				Value = 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return Value;
	}

}