# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: znajda <znajda@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2022/02/06 19:53:26 by znajda        #+#    #+#                  #
#    Updated: 2022/02/06 19:53:27 by znajda        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
BUILD_DIR = build
SRC =	$(BUILD_DIR)/char_c.o\
		$(BUILD_DIR)/ft_printf.o\
		$(BUILD_DIR)/hex_xX.o\
		$(BUILD_DIR)/int_di.o\
		$(BUILD_DIR)/percent.o\
		$(BUILD_DIR)/pointer_p.o\
		$(BUILD_DIR)/string_s.o\
		$(BUILD_DIR)/uint_u.o
VPATH = srcs/
CFLAGS = -Wall -Wextra -Werror

all: build_dir $(NAME)

$(NAME): $(SRC)
	@ ar rc $@ $^

$(BUILD_DIR)/%.o: %.c 
	@$(CC) -I ./includes/ -c -g $(CFLAGS) -o $@ $<

build_dir:
	clear
	@if [ -d "./$(BUILD_DIR)" ]; then \
	echo "Build Directory Already Exists"; \
	else \
	mkdir -p $(BUILD_DIR); \
	fi

clean:
	clear
	@echo Cleaning all Object Files 
	@ rm -f $(BUILD_DIR)/*.o

fclean: clean
	@Echo Removing Build Directory
	@if [ -d "./$(BUILD_DIR)" ]; then \
	rmdir $(BUILD_DIR); fi
	@ rm -f $(NAME)

re: fclean all