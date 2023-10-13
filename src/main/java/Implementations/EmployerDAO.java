package Implementations;

import Objects.Employer;
import Objects.Affectation;
import Objects.Person;
import Services.EmployerDAOInterface;
import Services.PersonDAOInterface;
import Utils.DBConnection;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class EmployerDAO extends PersonDAO implements EmployerDAOInterface {



    public EmployerDAO(){connection = DBConnection.getDBConnection();}
    @Override
    public Optional<Person> create(Person person) {
        Employer emp = (Employer) person;
        try {
            if (emp == null)
                throw new Exception("*****   Impossible d'ajouter un employee vide   *****");

            //start transaction
            String insertPersonQuery = "Insert into employer(nom,prenom,datenaissance,numeroTel,adresse,adressemail,daterecrutement) values(?,?,?,?,?,?,?) RETURNING matricule;";
            PreparedStatement stmt = connection.prepareStatement(insertPersonQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, emp.getNom());
            stmt.setString(2, emp.getPrenom());
            stmt.setDate(3, Date.valueOf(emp.getDateNaissance()));
            stmt.setString(4, emp.getNumeroTel());
            stmt.setString(5, emp.getAdresse());
            stmt.setString(6, emp.getAdresseEmail());
            stmt.setDate(7, Date.valueOf(emp.getDateRecrutement()));
            stmt.executeUpdate();
            var generatedKeys2 = stmt.getGeneratedKeys();
            if (generatedKeys2.next()) {
                return searchByMatricule(generatedKeys2.getInt(1));
            } else {

                return Optional.empty();
            }

        } catch (Exception e) {
            System.out.println(e.getClass() + "::" + e.getMessage());
        }
        return Optional.empty();


    }


    public List<Person> getAll() {
        String getAllQuery = "SELECT * from employer";
        List<Person> persons = new ArrayList<>();
        try {
            PreparedStatement stmt = connection.prepareStatement(getAllQuery);
            ResultSet result = stmt.executeQuery();
            while (result.next()) {
                Employer emp = new Employer();
                emp.setNom(result.getString("nom"));
                emp.setPrenom(result.getString("prenom"));
                emp.setAdresseEmail(result.getString("adressemail"));
                emp.setAdresse(result.getString("adresse"));
                emp.setNumeroTel(result.getString("numerotel"));
                emp.setDateNaissance(result.getDate("datenaissance").toLocalDate());
                emp.setMatricule(result.getInt("matricule"));
                emp.setDateRecrutement(result.getDate("daterecrutement").toLocalDate());

                persons.add((Person) emp);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return persons;
    }
    @Override
    public Integer delete(Integer id) {
        String deleteQuery = "delete from employer where matricule = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(deleteQuery);
            stmt.setInt(1, id);
            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("deletion failed");
            } else {
                return affectedRows;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }



    @Override
    public Optional<Person> update(Person person) {
        System.out.println("in update");

        Employer employerToUpdate = (Employer) person;
        try {
            String updatePersonQuery = "update employer set nom = ? , prenom = ? , datenaissance = ?, numeroTel = ? , adresse = ? , adressemail =? , dateRecrutement = ? where matricule = ?";
            System.out.println("employer to update 1 :" +employerToUpdate.getMatricule());
            PreparedStatement stmtPerson = connection.prepareStatement(updatePersonQuery);
            stmtPerson.setString(1, employerToUpdate.getNom());
            stmtPerson.setString(2, employerToUpdate.getPrenom());
            stmtPerson.setDate(3, Date.valueOf(employerToUpdate.getDateNaissance()));
            stmtPerson.setString(4, employerToUpdate.getNumeroTel());
            stmtPerson.setString(5, employerToUpdate.getAdresse());
            stmtPerson.setString(6, employerToUpdate.getAdresseEmail());
            stmtPerson.setDate(7, Date.valueOf(employerToUpdate.getDateRecrutement()));
            stmtPerson.setInt(8, employerToUpdate.getMatricule());
            int rowsUpdated = stmtPerson.executeUpdate();
            if (rowsUpdated == 0) {
                return Optional.empty();
            }else return searchByMatricule(employerToUpdate.getMatricule());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return Optional.empty();
    }

    public Optional<Person> searchByMatricule(Integer matricule) {
        Employer emp = new Employer();
        String searchQuery = "SELECT * from employer where matricule = ?;";
        try {
            PreparedStatement stmt = connection.prepareStatement(searchQuery);
            stmt.setInt(1, matricule);
            ResultSet result = stmt.executeQuery();
            if (result.next()) {
                emp.setNom(result.getString("nom"));
                emp.setPrenom(result.getString("prenom"));
                emp.setAdresseEmail(result.getString("adressemail"));
                emp.setAdresse(result.getString("adresse"));
                emp.setMatricule(result.getInt("matricule"));
                emp.setNumeroTel(result.getString("numerotel"));
                emp.setDateRecrutement(result.getDate("daterecrutement").toLocalDate());
                emp.setDateNaissance(result.getDate("datenaissance").toLocalDate());
                /*incomplete*/
                return Optional.of(emp);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return Optional.empty();
    }
    /* todo */
    public List<Affectation> getAllAffectations(Employer employer) {
        return null;
    }

    public Affectation getCurrentAffectation(Employer employer) {
        return null;
    }

}
