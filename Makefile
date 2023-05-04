clean:
	$(RM) *.o
	ls | grep -v "\." | xargs rm
