# 20220409 fmc - Sysadmin Challenge Q9
#
if __name__ == '__main__':
    with open('/tmp/output_1.txt') as input_file, open('/tmp/output_2.txt','+w') as output_file:
        for line in input_file:
            lista = line.split()
            out_line = lista[0]
            for spaces in range(0,18-len(lista[0])):
                 out_line += str(" ")
            for items in range(1,len(lista)):
                out_line += str("   ") + lista[items]
            out_line += '\n'
            output_file.write(out_line)
