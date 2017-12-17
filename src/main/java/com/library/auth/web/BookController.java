package com.library.auth.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.auth.model.Author;
import com.library.auth.model.Book;
import com.library.auth.model.Member;
import com.library.auth.service.AuthorService;
import com.library.auth.service.BookService;
import com.library.auth.service.DefinitionService;
import com.library.auth.service.DefinitionTypeService;

@Controller
@RequestMapping(value = "/Book")
public class BookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private AuthorService authorService;

	@Autowired
	private DefinitionService definitionService;

	@RequestMapping(value = "/Createbook", method = RequestMethod.GET)
	public String Createbook(Model model) {
		model.addAttribute("book", new Book());

		List Authors = authorService.getAuthors();

		List Booktypes = definitionService.findBydefname("Book Type");

		model.addAttribute("Authors", Authors);
		model.addAttribute("booktypes", Booktypes);
		return "bookForm";
	}

	@RequestMapping(value = "/Savebook", method = RequestMethod.POST)
	public String Savebook(@Valid @ModelAttribute("book") Book theBook, BindingResult bindingResult, Model model) {
		// userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {

			// Dropdown listeleri için eklendi
			List Authors = authorService.getAuthors();
			List Booktypes = definitionService.findBydefname("Book Type");
			model.addAttribute("Authors", Authors);
			model.addAttribute("booktypes", Booktypes);

			return "bookForm";
		}

		bookService.save(theBook);

		return "redirect:/Book/listOfBooks";
	}

	@RequestMapping(value = "/listOfBooks", method = RequestMethod.GET)
	public String listOfBooks(Model model) {

		List<Book> listOfBooks = bookService.getBooks();
		model.addAttribute("books", listOfBooks);

		return "listOfBooks";
	}

	@RequestMapping(value = "/Updatebook", method = RequestMethod.POST)
	public String Updatebook(@RequestParam("bookid") Long id, Model model) {
		// userValidator.validate(userForm, bindingResult);

		List Authors = authorService.getAuthors();
		List Booktypes = definitionService.findBydefname("Book Type");
		Book book = bookService.getBookById(id);

		model.addAttribute("book", book);
		model.addAttribute("Authors", Authors);
		model.addAttribute("booktypes", Booktypes);

		return "bookForm";
	}

	@RequestMapping(value = "/Deletebook", method = RequestMethod.POST)
	public String Deletebook(@RequestParam("bookid") Long id, Model model) {

		bookService.delete(id);
		// Yeni bir kayıt gönder

		model.addAttribute("Message", "Success");

		return "redirect:/Book/listOfBooks";
	}

}
