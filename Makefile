NAME = libft.a 

HEADER = libft.h

SOURCES = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c \
		  ft_itoa.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c \
		  ft_putnbr_fd.c ft_putstr_fd.c ft_split.c ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c \
		  ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c \
		  ft_tolower.c ft_toupper.c \

SOURCES_BONUS = ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c ft_lstiter.c \
				ft_lstlast.c ft_lstmap.c ft_lstnew.c ft_lstsize.c \

OBJECTS = $(SOURCES:.c=.o)

OBJECTS_BONUS = $(SOURCES_BONUS:.c=.o)

CC = cc

CFLAGS = -Wall -Werror -Wextra

ARFLAGS = -rcs

RMFLAGS = -rf 

all : $(NAME)

$(NAME) : $(OBJECTS) $(HEADER)
	ar $(ARFLAGS) $(NAME) $(OBJECTS)

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

bonus : $(OBJECTS) $(OBJECTS_BONUS) $(HEADER)
	ar $(ARFLAGS) $(NAME) $(OBJECTS) $(OBJECTS_BONUS)

clean :
	rm $(RMFLAGS) $(OBJECTS) $(OBJECTS_BONUS)

fclean : clean
	rm $(RMFLAGS) $(NAME)

so:
	$(CC) -nostartfiles -fPIC $(CFLAGS) $(SOURCES) $(SOURCES_BONUS)
	gcc -nostartfiles -shared -o libft.so $(OBJECTS) $(OBJECTS_BONUS)

re : fclean all

.PHONY = all, clean, fclean, re
