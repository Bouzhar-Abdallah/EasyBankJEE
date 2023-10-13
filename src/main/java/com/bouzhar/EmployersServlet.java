package com.bouzhar;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import Implementations.EmployerDAO;
import Objects.Employer;
import Objects.Person;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "EmployersServlet", urlPatterns = {"/employers/*", "/employers/update/*", "/employers/delete", "/employers/new"})
public class EmployersServlet extends HttpServlet {
    private EmployerDAO employerDAO;

    public void init() {
        employerDAO = new EmployerDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String requestURL = request.getServletPath();
        String lastPart = request.getServletPath().substring(request.getServletPath().lastIndexOf("/") + 1);
        //System.out.println("Last part: " + lastPart);
        //System.out.println(requestURL);
                String matricule = request.getParameter("matricule");

        switch (lastPart) {
            case "employers":
                request.setAttribute("clients", employerDAO.getAll());
                getServletContext().getRequestDispatcher("/employers.jsp").forward(request, response);
                break;
            case "update":
                if (employerDAO.searchByMatricule(Integer.valueOf(matricule)).isPresent()) {
                    request.setAttribute("employer", employerDAO.searchByMatricule(Integer.valueOf(matricule)).get());
                request.getRequestDispatcher("/updateEmployer.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("employers").forward(request, response);
                }
                break;
            case "delete":

                if (employerDAO.searchByMatricule(Integer.valueOf(matricule)).isPresent()) {
                    request.setAttribute("employer", employerDAO.searchByMatricule(Integer.valueOf(matricule)).get());
                }else{
                    request.getRequestDispatcher("employers").forward(request, response);

                }
                request.getRequestDispatcher("/deleteEmployer.jsp").forward(request, response);
                break;
            case "new":
                request.getRequestDispatcher("/createEmployer.jsp").forward(request, response);
                break;
            default:
                break;
        }
        //System.out.println("from get");


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("_METHOD");
        if ("updateForm".equals(method)) {
            int matricule = Integer.valueOf(req.getParameter("matricule"));
            Optional<Person> optionalPerson = employerDAO.searchByMatricule(matricule);
            optionalPerson.ifPresent(person -> {
                if (person instanceof Employer) {
                    Employer employer = (Employer) person;
                    req.setAttribute("person", employer);
                }
            });
            req.getRequestDispatcher("/updateEmployer.jsp").forward(req, resp);
        }else if("submitedUpdate".equals(method)){
            doPut(req, resp);
        } else if ("delete".equals(method)) {
            doDelete(req, resp);
        } else if ("POST".equals(method)) {
            Employer emp = new Employer();
            emp.setNom(req.getParameter("nom"));
            emp.setPrenom(req.getParameter("prenom"));
            emp.setAdresse(req.getParameter("adresse"));
            emp.setDateRecrutement(LocalDate.parse(req.getParameter("dateRecrutement")));
            emp.setAdresseEmail(req.getParameter("adresseEmail"));
            emp.setDateNaissance(LocalDate.parse(req.getParameter("dateNaissance")));
            emp.setNumeroTel(req.getParameter("numeroTel"));
            employerDAO.create(emp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Employer emp = new Employer();
        emp.setNom(req.getParameter("nom"));
        emp.setPrenom(req.getParameter("prenom"));
        emp.setAdresse(req.getParameter("adresse"));
        emp.setDateRecrutement(LocalDate.parse(req.getParameter("dateRecrutement")));
        emp.setAdresseEmail(req.getParameter("adresseEmail"));
        emp.setDateNaissance(LocalDate.parse(req.getParameter("dateNaissance")));
        emp.setNumeroTel(req.getParameter("numeroTel"));
        emp.setMatricule(Integer.valueOf(req.getParameter("matricule")));
        if (employerDAO.update(emp).isPresent()){
                resp.sendRedirect("/easybankjee/employers");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("from delete");
        String id = req.getParameter("id");
        //System.out.println("path info : " + id);
        employerDAO.delete(Integer.valueOf(id));
        //super.doDelete(req, resp);
    }

    private int extractMatricule(String pathInfo) {
        if (pathInfo != null) {
            String[] pathElements = pathInfo.split("/");
            if (pathElements.length > 1) {
                try {
                    return Integer.parseInt(pathElements[1]);
                } catch (NumberFormatException e) {
                    // Handle parsing error
                }
            }
        }
        // Handle invalid or missing matricule
        return -1; // Or throw an exception, return a default value, etc.
    }

    public void destroy() {
    }
}