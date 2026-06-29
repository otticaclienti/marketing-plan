# Pitch di vendita — Ottica Clienti → Centro Ottico Fiorentino

Presentazione di vendita professionale (13 slide, 16:9) per proporre il servizio
di acquisizione pazienti di **Ottica Clienti** a **Centro Ottico Fiorentino** (Firenze).

## File
- `presentation.html` — sorgente della presentazione (tutto il contenuto e il design).
- `OtticaClienti_Pitch_CentroOtticoFiorentino.pdf` — il PDF pronto da inviare/presentare.
- `assets/fonts/` — font incorporati (Space Grotesk per i titoli, Manrope per il testo).
- `assets/img/` — grafica "iride/topografica" usata come motivo del brand.
- `build.sh` — rigenera il PDF dall'HTML.

## Rigenerare il PDF
```bash
./build.sh
```

## Struttura delle slide
1. Copertina — entrambi i loghi, titolo, dati della proposta
2. Indice
3. 01 · Situazione attuale (il problema)
4. 02 · Punti di forza
5. 03 · La soluzione (filosofia)
6. 04 · Il metodo VTR (Visita · Torna · Raccomanda)
7. 05 · La lista contatti
8. 06 · Le campagne pubblicitarie
9. 07 · Il piano in 4 mesi
10. 08 · Esclusiva di zona (bonus)
11. 09 · Investimento & garanzia
12. 10 · In sintesi (perché funziona)
13. Chiusura / call to action

## Loghi
- **Ottica Clienti** e **Centro Ottico Fiorentino** sono resi come *wordmark* tipografici
  coordinati (il piano originale non conteneva un file logo, ma un logotipo testuale).
- Per inserire un **logo immagine** reale: salvalo in `assets/img/` (es. `logo-cof.svg`)
  e sostituisci il blocco `.wm.client` nella `.topbar` con un `<img>`. Poi `./build.sh`.

## Design
- Tema **chiaro** (sfondo bianco), stile editoriale premium con ampi spazi.
- Verde brand Ottica Clienti `#0E7A48` come accento primario; rosso COF `#b21f27` come secondario.
- Loghi ricostruiti in SVG vettoriale e usati in grande in copertina/chiusura.
- Motivo "iride/lente" in line-art vettoriale (`assets/img/iris-line.svg`).
- Chiusura su fondo scuro per contrasto/impatto finale.
