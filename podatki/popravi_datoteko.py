def popravi_datoteko(vhodna):
    with open(vhodna) as dat:
        for vrstica in dat:
            stevec = 0
            for element in vrstica:
                if element == ";":
                    stevec += 1
                elif stevec == 2:
                    besedilo = ""
                    while znak != ";":
                        if znak in "QWERTZUIOPASDFGHJKLYXCVBNMqwertzuiopasdfghjklyxcvbnm/":
                            besedilo = besedilo + str(znak)
                        elif znak == "(":
                            while znak != ")":
                                besedilo = besedilo + str(znak)
                            besedilo = ""
    return dat
