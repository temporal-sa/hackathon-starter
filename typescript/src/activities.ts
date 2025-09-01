// If you wish to connect any dependencies (eg, database), add in here
export const createActivities = (/* db: typeorm.DataSource */) => ({
  async sayName(name: string): Promise<string> {
    if (!name) {
      name = 'anonymous human';
    }

    return `Hello, ${name}!`;
  },
});
