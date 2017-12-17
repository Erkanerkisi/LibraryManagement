package com.library.auth.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.auth.model.Member;
import com.library.auth.model.Transaction;
import com.library.auth.service.BookService;
import com.library.auth.service.MemberService;
import com.library.auth.service.TransactionService;

@Controller
@RequestMapping(value = "/Transaction")
public class TransactionController {

	@Autowired
    private TransactionService transactionService;
	
	@Autowired
    private MemberService memberService;
	
	@Autowired
    private BookService bookService;
	
	
	@RequestMapping(value = "/Createtransaction", method = RequestMethod.GET)
    public String Createtransaction(Model model) {
        model.addAttribute("transaction", new Transaction());
        
        model.addAttribute("Books",bookService.getBooks());
        model.addAttribute("Members", memberService.getMembers());
        
        System.out.println("Create =>>>>>>>>>>>> " + bookService.getBooks());
        return "transactionForm";
    }
	
	@RequestMapping(value = "/listoftransactions", method = RequestMethod.GET)
    public String listoftransactions(Model model) {

		List<Transaction> listoftransaction = transactionService.getTransactions();
        model.addAttribute("transactions",listoftransaction);

        return "listOfTransactions";
    }
	
	
	@RequestMapping(value = "/Savetransaction", method = RequestMethod.POST)
    public String Savetransaction(@Valid @ModelAttribute("transaction") Transaction theTransaction, BindingResult bindingResult, Model model) {
        //userValidator.validate(userForm, bindingResult);
		
        
		if (bindingResult.hasErrors()) {

        	model.addAttribute("Members", memberService.getMembers());
            model.addAttribute("Books",bookService.getBooks() );
            
            model.addAttribute("Message","Failed");
            
            return "redirect:/Transaction/listoftransactions";
        }
        
        transactionService.save(theTransaction);
        //Yeni bir kayıt gönder
        model.addAttribute("transaction", new Transaction());
        model.addAttribute("Members", memberService.getMembers());
        model.addAttribute("Books",bookService.getBooks() );
        
        model.addAttribute("Message","Success");

        return "transactionForm";
    }
	
	
	@RequestMapping(value = "/Deletetransaction", method = RequestMethod.POST)
    public String Deletetransaction(@RequestParam("transactionid") Long id, Model model) {
        //userValidator.validate(userForm, bindingResult);
		
		
        /*
		if (bindingResult.hasErrors()) {

        	model.addAttribute("Members", memberService.getMembers());
            model.addAttribute("Books",bookService.getBooks() );
            
            model.addAttribute("Message","Failed");
            
            return "transactionForm";
        }
		*/
        transactionService.delete(id);
        //Yeni bir kayıt gönder
        
        model.addAttribute("Message","Success");

        return "redirect:/Transaction/listoftransactions";
    }
	
	@RequestMapping(value = "/Updatetransaction", method = RequestMethod.POST)
    public String Updatetransaction(@RequestParam("transactionid") Long id, Model model) {
        //userValidator.validate(userForm, bindingResult);

		Transaction transaction = transactionService.getTransactionById(id);
		System.out.println("id =>>>> " + id);
		model.addAttribute("Members", memberService.getMembers());
        model.addAttribute("Books",bookService.getBooks() );
        model.addAttribute("transaction",transaction);
        

        return "transactionForm";
    }
	
	
	@RequestMapping(value = "/Searchtransactions", method = RequestMethod.POST)
	public String Searchmembers(@RequestParam("name") String name, 
								@RequestParam("surname") String surname,
								@RequestParam("bookname") String bookname,
								@RequestParam("tradate") String tradate, Model model) {
		// userValidator.validate(userForm, bindingResult);

		List<Transaction> listoftransaction = transactionService.search(name,surname,bookname,tradate);
		model.addAttribute("transactions", listoftransaction);

		return "listOfTransactions";
	}
	
	
	

}
