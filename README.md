# FPGA_uni

Questa repository raccoglie i progetti, le esercitazioni e il materiale didattico sviluppato durante il corso universitario di **Sistemi Digitali / Progettazione su FPGA**.

L'obiettivo principale è l'apprendimento della progettazione hardware mediante linguaggi di descrizione dell'hardware (HDL) come **VHDL**, con particolare focus sull'implementazione pratica su schede di sviluppo DE10-Lite.

## 📚 Contenuti della Repository

La repository è organizzata per coprire i due domini principali della progettazione FPGA:

### 1. Elaborazione dei Segnali (DSP)
Implementazione di algoritmi aritmetici e computazionali ottimizzati per l'hardware:
- Progettazione di filtri digitali (FIR/IIR).
- Implementazione di FFT (Fast Fourier Transform).
- Pipeline ad alto throughput per calcoli matematici complessi.

### 2. Interfacciamento e Controllo
Sviluppo di moduli per la comunicazione con periferiche esterne:
- **Protocolli di Comunicazione:** Implementazione di master SPI, I2C e UART.
- **Gestione Periferiche:** Interfacciamento con sensori, display LCD, memorie DDR RAM e convertitori (ADC/DAC).
- **Logica di Controllo:** Progettazione di Macchine a Stati Finiti (FSM) per coordinare le operazioni di sistema.

## 🛠️ Strumenti Utilizzati

- **Software di Sviluppo:** Intel Quartus Prime.
- **Linguaggi:** VHDL.
- **Simulazione:** QuestaSim per la verifica funzionale prima del deployment su hardware.

## 🚀 Metodologia di Progettazione

Ogni progetto segue un flusso di lavoro standard per garantire affidabilità e performance:
1. **Analisi del Datasheet:** Estrazione dei parametri critici (timing, frequenze di clock, protocolli).
2. **Definizione delle Porte:** Progettazione accurata dell'interfaccia del modulo (segnali `data_ready`, `busy`, `send`).
3. **Coding bare-metal:** Scrittura del codice HDL seguendo template standard per facilitare la sintesi.
4. **Registrazione I/O:** Tecnica di buffering dei segnali di input/output per ottimizzare il routing e migliorare la frequenza di clock massima.
5. **Simulazione e Test:** Verifica su testbench e successiva validazione su hardware reale.
